describe "Rubinius::ToolSets::Runtime::CompiledFile::Marshal#unmarshal" do
  before :each do
    @marshal = Rubinius::ToolSets::Spec::CompiledFile::Marshal.new
  end

  it "unmarshals true" do
    @marshal.unmarshal("t\n").should == true
  end

  it "unmarshals false" do
    @marshal.unmarshal("f\n").should == false
  end

  it "unmarshals nil" do
    @marshal.unmarshal("n\n").should == nil
  end

  it "unmarshals an Integer" do
    @marshal.unmarshal("I\nCAFEF00D").should == 0xCAFEF00D
  end

  it "unmarshals a Float" do
    @marshal.unmarshal("d\n +0.785000000000000031086244689504383131861686706542968750     2\n").should == 3.14
  end

  it "unmarshals +infinity" do
    @marshal.unmarshal("d\nInfinity\n").should be_positive_infinity
  end

  it "unmarshals -infinity" do
    @marshal.unmarshal("d\n-Infinity\n").should be_negative_infinity
  end

  it "unmarshals NaN" do
    @marshal.unmarshal("d\nNaN\n").should be_nan
  end

  it "unmarshals a Symbol" do
    @marshal.unmarshal("x\nE\n8\nUS-ASCII\n12\nHello world!\n").should == :"Hello world!"
  end

  it "unmarshals a constant" do
    @marshal.unmarshal("c\n18\nRubinius::ToolSets\n").should == Rubinius::ToolSets
  end

  it "unmarshals a String" do
    str = @marshal.unmarshal("s\nE\n5\nUTF-8\n12\nHello world!\n")
    str.should == "Hello world!"
    str.encoding.should == Encoding::UTF_8
  end

  it "unmarshals an encoding" do
    @marshal.unmarshal("E\n5\nUTF-8\n13\n").should == Encoding::UTF_8
  end
end
