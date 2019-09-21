defmodule Domain.Auth do
  def hash_password(password), do: Argon2.hash_pwd_salt(password, salt_len: 64)

  def verify_pass(password, hash), do: Argon2.verify_pass(password, hash)

  def dummy_verify, do: Argon2.no_user_verify()
end
