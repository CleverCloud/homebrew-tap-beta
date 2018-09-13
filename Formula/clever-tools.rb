class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud."
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.cellar.services.clever-cloud.com/releases/1.0.0-beta.16/clever-tools-1.0.0-beta.16_macos.tar.gz"
  version "1.0.0-beta.16"
  sha256 "55c7423e32dc9daed11d9e3c5cdaf89d3025c556ed3dd3b32b78fe1790352989"

  depends_on "bash-completion" => :recommended
  depends_on "zsh-completions" => :recommended

  def install
    bin.install "clever"
    system "mkdir -p #{prefix}/completions/bash"
    system "mkdir -p #{prefix}/completions/zsh"
    system "#{prefix}/bin/clever --bash-autocomplete-script clever > #{prefix}/completions/bash/clever"
    system "#{prefix}/bin/clever --zsh-autocomplete-script clever >  #{prefix}/completions/zsh/_clever"

    bash_completion.install "#{prefix}/completions/bash/clever"
    zsh_completion.install "#{prefix}/completions/zsh/_clever"
  end

  test do
    system "clever --version"
  end
end
