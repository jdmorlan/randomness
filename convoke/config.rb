module Configuration

  COLUMNS = ['A', 'B', 'E']

  def self.default_parse_contexts

    @parse_contexts = [
      ParseContext.new(:key => 'TA-18', :rows =>  [*(11..16), *(27..30)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-28', :rows =>  [*(49..54), *(65..68)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-38', :rows =>  [*(88..93), *(107..109)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-48', :rows =>  [*(88..93), *(107..109)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-26', :rows =>  [*(209..216), *(230..233)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-30', :rows =>  [*(209..216), *(230..233)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-35', :rows =>  [*(209..216), *(230..233)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-2000', :rows =>  [*(571..573), *(580..585)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-3000', :rows =>  [*(607..609), *(616..621)].flatten, :columns => COLUMNS),
      ParseContext.new(:key => 'TA-6000', :rows =>  [*(643..645), *(654..656), *(660..662)].flatten, :columns => COLUMNS)
    ]

    @parse_contexts
  end
end
