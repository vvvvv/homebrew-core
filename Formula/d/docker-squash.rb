class DockerSquash < Formula
  include Language::Python::Virtualenv

  desc "Docker image squashing tool"
  homepage "https://github.com/goldmann/docker-squash"
  url "https://files.pythonhosted.org/packages/3c/83/c0a3cee67e2af20c7c337fd7cd49b49c9a741e785e7a4c631404a03b7a00/docker-squash-1.2.0.tar.gz"
  sha256 "33120a217fa9804530d1cf8091aacc5abf9020c6bc51c5108ae80ff8625782df"
  license "MIT"
  revision 3

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "dff569002286600cfa9830fb77a0d47e7df5c83359aac7e21448d99d5ed81404"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "70c7ffa1daf8d34b25948994a92c4be9ccb46b8a63e0a58fdcf52e21f903709c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b3b6bc09fdafccb0fb76c3f73a239314ae96f3a0699bd6706e8a7eb8aec28204"
    sha256 cellar: :any_skip_relocation, sonoma:         "02eb60eec6ca21b82ea2dd8a04f4b3c50f59bfadfe8f381353716dbf23f8f8ba"
    sha256 cellar: :any_skip_relocation, ventura:        "ae3246bb02b5fffb5638c2c8f7de2bd4ca1c1c118ed872fd065c90159b94c408"
    sha256 cellar: :any_skip_relocation, monterey:       "79c3fe472dda4af1b58dc704694dc90cfff409547c8c5e555b81d83612af0df7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "218771e825cc95ccabafff4d469155e14666dbbee9e71a98321df70334beddf4"
  end

  depends_on "certifi"
  depends_on "python@3.12"

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "docker" do
    url "https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce/docker-7.1.0.tar.gz"
    sha256 "ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07/idna-3.7.tar.gz"
    sha256 "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/51/65/50db4dda066951078f0a96cf12f4b9ada6e4b811516bf0262c0f4f7064d4/packaging-24.1.tar.gz"
    sha256 "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6/urllib3-2.2.2.tar.gz"
    sha256 "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    ENV["DOCKER_HOST"] = "does-not-exist:1234"
    output = shell_output("#{bin}/docker-squash not_an_image 2>&1", 1)
    assert_match "Could not create Docker client", output
  end
end
