require "formula"

class MLPGoAuth < Formula
  desc "CLI to get tokens"
  homepage "https://bitbucket.org/microblink/mlp-go-auth"
  on_linux do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/mlp-go-auth/v0.0.28/mlp-go-auth-linux-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/mlp-go-auth/v0.0.28/mlp-go-auth-linux-amd64.gz"
    end
  end

  on_macos do
    on_arm do
        url "https://build-artifacts.mle.microblink.com/mlp-go-auth/v0.0.28/mlp-go-auth-darwin-arm64.gz"
    end
    on_intel do
        url "https://build-artifacts.mle.microblink.com/mlp-go-auth/v0.0.28/mlp-go-auth-darwin-amd64.gz"
    end
  end

  def install
    if OS.linux?
        if Hardware::CPU.arm?
            system "mv mlp-go-auth-linux-arm64 mlp-go-auth"
        else
            system "mv mlp-go-auth-linux-amd64 mlp-go-auth"
        end
    end
    if OS.mac?
        if Hardware::CPU.arm?
            system "mv mlp-go-auth-darwin-arm64 mlp-go-auth"
        else
            system "mv mlp-go-auth-darwin-amd64 mlp-go-auth"
        end
    end
    bin.install "mlp-go-auth"
  end

  # Homebrew requires tests.
  test do
    assert_match "0.0.28", shell_output("#{bin}/mlp-go-auth -v", 2)
  end

end
