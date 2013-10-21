require 'colorize'
require_relative '../nodes'

describe Zest::Nodes do
  context 'render' do
    before (:all) do
      @null = Zest::Nodes::NullLiteral.new
      @what_is_your_quest = Zest::Nodes::StringLiteral.new("What is your quest ?")
      @fighters = Zest::Nodes::StringLiteral.new('fighters')
      @pi = Zest::Nodes::NumericLiteral.new(3.14)
      @false = Zest::Nodes::BooleanLiteral.new(false)
      @true = Zest::Nodes::BooleanLiteral.new(true)
      @foo_variable = Zest::Nodes::Variable.new('foo')
      @x_variable = Zest::Nodes::Variable.new('x')

      @foo_fighters_prop = Zest::Nodes::Property.new(@foo_variable, @fighters)
      @foo_dot_fighters = Zest::Nodes::Field.new(@foo_variable, 'fighters')
      @foo_brackets_fighters = Zest::Nodes::Index.new(@foo_variable, @fighters)
      @foo_minus_fighters = Zest::Nodes::BinaryExpression.new(@foo_variable, '-', @fighters)
      @minus_foo = Zest::Nodes::UnaryExpression.new('-', @foo_variable)
      @parenthesis_foo = Zest::Nodes::Parenthesis.new(@foo_variable)

      @foo_list = Zest::Nodes::List.new([@foo_variable, @fighters])
      @foo_dict =  Zest::Nodes::Dict.new([@foo_fighters_prop,
        Zest::Nodes::Property.new('Alt', 'J')
      ])
      @foo_template = Zest::Nodes::Template.new([@foo_variable, @fighters])
      @assign_fighters_to_foo = Zest::Nodes::Assign.new(@foo_variable, @fighters)
      @assign_foo_to_fighters = Zest::Nodes::Assign.new(
        Zest::Nodes::Variable.new('fighters'),
        Zest::Nodes::StringLiteral.new('foo'))
      @call_foo = Zest::Nodes::Call.new('foo')
      @call_foo_with_fighters = Zest::Nodes::Call.new('foo', [@fighters])

      @simple_tag = Zest::Nodes::Tag.new('myTag')
      @valued_tag = Zest::Nodes::Tag.new('myTag', 'somevalue')

      @plic_param = Zest::Nodes::Parameter.new('plic')
      @x_param = Zest::Nodes::Parameter.new('x')
      @plic_param_default_ploc = Zest::Nodes::Parameter.new(
        'plic',
        Zest::Nodes::StringLiteral.new('ploc'))
      @flip_param_default_flap = Zest::Nodes::Parameter.new(
        'flip',
        Zest::Nodes::StringLiteral.new('flap'))
    end

    it 'NullLiteral' do
      @null.render.should eq('nil')
    end

    it 'StringLiteral' do
      @what_is_your_quest.render.should eq("'What is your quest ?'")
    end

    it 'NumericLiteral' do
      @pi.render.should eq('3.14')
    end

    it 'BooleanLiteral' do
      @false.render.should eq('false')
    end

    it 'Variable' do
      @foo_variable.render.should eq('foo')
    end

    it 'Property' do
      @foo_fighters_prop.render.should eq("foo: 'fighters'")
    end

    it 'Field' do
      @foo_dot_fighters.render.should eq('foo.fighters')
    end

    it 'Index' do
      @foo_brackets_fighters.render.should eq("foo['fighters']")
    end

    it 'BinaryExpression' do
      @foo_minus_fighters.render.should eq("foo - 'fighters'")
    end

    it 'UnaryExpression' do
      @minus_foo.render.should eq('-foo')
    end

    it 'Parenthesis' do
      @parenthesis_foo.render.should eq('(foo)')
    end

    it 'List' do
      @foo_list.render.should eq("[foo, 'fighters']")
    end

    it 'Dict' do
      @foo_dict.render.should eq("{foo: 'fighters', Alt: J}")
    end

    it 'Template' do
      @foo_template.render.should eq('"#{foo}fighters"')
    end

    it 'Assign' do
      @assign_fighters_to_foo.render.should eq("foo = 'fighters'\n")
    end

    it 'Call' do
      @call_foo.render.should eq("foo()\n")
      @call_foo_with_fighters.render.should eq("foo('fighters')\n")
    end

    it 'IfThen' do
      if_then = Zest::Nodes::IfThen.new(@true, [@assign_fighters_to_foo])
      if_then.render.should eq([
          "if true",
          "  foo = 'fighters'",
          "end\n"
        ].join("\n"))

      if_then_else = Zest::Nodes::IfThen.new(
        @true, [@assign_fighters_to_foo], [@assign_foo_to_fighters])
      if_then_else.render.should eq([
          "if true",
          "  foo = 'fighters'",
          "else",
          "  fighters = 'foo'",
          "end\n"
        ].join("\n"))
    end

    it "Step" do
      action_foo_fighters = Zest::Nodes::Step.new([
        Zest::Nodes::Property.new('action', @foo_template)
      ])

      action_foo_fighters.render.should eq('# TODO: Implement action: "#{foo}fighters"')
    end

    it 'While' do
      n = Zest::Nodes::While.new(
        @foo_variable,
        [
          @assign_foo_to_fighters,
          @call_foo_with_fighters
        ])
      n.render.should eq([
          "while foo",
          "  fighters = 'foo'",
          "  foo('fighters')",
          "end\n"
        ].join("\n"))
    end

    it 'Tag' do
      @simple_tag.render.should eq('myTag')
      @valued_tag.render.should eq('myTag:somevalue')
    end

    it 'Parameter' do
      @plic_param.render.should eq('plic')
      @plic_param_default_ploc.render.should eq("plic = 'ploc'")
    end

    context 'Actionword' do
      it 'empty' do
        empty_action_word = Zest::Nodes::Actionword.new('my action word')
        empty_action_word.render.should eq("def my_action_word()\nend")
      end

      it 'with tags' do
        tagged_action_word = Zest::Nodes::Actionword.new(
          'my action word',
          [@simple_tag, @valued_tag])

        tagged_action_word.render.should eq([
          "def my_action_word()",
          "  # Tags: myTag myTag:somevalue",
          "end"].join("\n"))
      end

      it 'with parameters' do
        parameterized_action_word = Zest::Nodes::Actionword.new(
          'my action word',
          [],
          [@plic_param, @flip_param_default_flap])

        parameterized_action_word.render.should eq([
          "def my_action_word(plic, flip = 'flap')",
          "end"].join("\n"))
      end

      it 'with body' do
        n = Zest::Nodes::Actionword.new(
          'compare to pi',
          [@simple_tag],
          [@x_param],
          [
            Zest::Nodes::Assign.new(@foo_variable, @pi),
            Zest::Nodes::IfThen.new(
              Zest::Nodes::Parenthesis.new(
                Zest::Nodes::BinaryExpression.new(
                  @foo_variable,
                  '>',
                  @x_variable
                )
              ),
              [
                Zest::Nodes::Step.new([
                  Zest::Nodes::Property.new('result', "x is greater than Pi")
                  ])
              ],
              [
                Zest::Nodes::Step.new([
                  Zest::Nodes::Property.new('result', "x is lower than Pi\n on two lines")
                ])
              ])
            ])

          n.render.should eq([
            "def compare_to_pi(x)",
            "  # Tags: myTag",
            "  foo = 3.14",
            "  if (foo > x)",
            "    # TODO: Implement result: x is greater than Pi",
            "  else",
            "    # TODO: Implement result: x is lower than Pi",
            "    # on two lines",
            "  end",
            "end"].join("\n"))
      end
    end

    it 'Scenario' do
      n = Zest::Nodes::Scenario.new(
        'compare to pi',
         "This is a scenario which description \nis on two lines",
        [@simple_tag],
        [@x_param],
        [
          Zest::Nodes::Assign.new(@foo_variable, @pi),
          Zest::Nodes::IfThen.new(
            Zest::Nodes::Parenthesis.new(
              Zest::Nodes::BinaryExpression.new(
                @foo_variable,
                '>',
                @x_variable
              )
            ),
            [
              Zest::Nodes::Step.new([
                Zest::Nodes::Property.new('result', "x is greater than Pi")
                ])
            ],
            [
              Zest::Nodes::Step.new([
                Zest::Nodes::Property.new('result', "x is lower than Pi\n on two lines")
              ])
            ])
          ])

        n.render.should eq([
          "it 'compare to pi' do",
          "  # This is a scenario which description ",
          "  # is on two lines",
          "  # Tags: myTag",
          "  foo = 3.14",
          "  if (foo > x)",
          "    # TODO: Implement result: x is greater than Pi",
          "  else",
          "    # TODO: Implement result: x is lower than Pi",
          "    # on two lines",
          "  end",
          "end"].join("\n"))
    end

    it 'Actionwords' do
      n = Zest::Nodes::Actionwords.new([
        Zest::Nodes::Actionword.new('first action word'),
        Zest::Nodes::Actionword.new(
          'second action word', [], [], [
            Zest::Nodes::Call.new('first action word')
          ])
      ])
      n.render.should eq([
        "# encoding: UTF-8",
        "",
        "class Actionwords",
        "  def first_action_word()",
        "  end",
        "  def second_action_word()",
        "    first_action_word()",
        "  end",
        "end"].join("\n"))
    end

    it 'Scenarios' do
      n = Zest::Nodes::Scenarios.new([
        Zest::Nodes::Scenario.new('first scenario'),
        Zest::Nodes::Scenario.new(
          'second scenario', '', [], [], [
            Zest::Nodes::Call.new('my action word')
          ])
      ])
      n.parent = Zest::Nodes::Project.new('My_project')
      n.parent.render

      n.render('ruby', {call_prefix: 'actionwords'}).should eq([
        "# encoding: UTF-8",
        "require_relative 'actionwords'",
        "",
        "describe 'My_project' do",
        "  before (:all) do",
        "    @actionwords = My_project::ActionWords.new",
        "  end",
        "",
        "  it 'first scenario' do",
        "  end",
        "  it 'second scenario' do",
        "    @actionwords.my_action_word()",
        "  end",
        "end"].join("\n"))
    end
  end
end