import aes256 from "aes256";

var key = "obvwoqcbv21801f19d0zibcoavwpnq";

export const DoEncrypt = (text) => {
  var encrypted = aes256.encrypt(key, text);
  return encrypted;
};
export const DoDecrypt = (cipher) => {
  var decrypted = aes256.decrypt(key, cipher);
  return decrypted;
};