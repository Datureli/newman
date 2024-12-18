const header = { alg: "HS256", typ: "JWT" };
const payload = {
  iat: Math.floor(Date.now() / 1000),
  exp: Math.floor(Date.now() / 1000) + 3600,
};
const secretKey = "TwojSekretnyKlucz";

function base64urlEncode(source) {
  return CryptoJS.enc.Base64.stringify(source)
    .replace(/=+$/, "")
    .replace(/\+/g, "-")
    .replace(/\//g, "_");
}

const encodedHeader = base64urlEncode(
  CryptoJS.enc.Utf8.parse(JSON.stringify(header))
);
const encodedPayload = base64urlEncode(
  CryptoJS.enc.Utf8.parse(JSON.stringify(payload))
);
const signature = CryptoJS.HmacSHA256(
  encodedHeader + "." + encodedPayload,
  secretKey
);
const encodedSignature = base64urlEncode(signature);

const jwtToken = `${encodedHeader}.${encodedPayload}.${encodedSignature}`;
pm.environment.set("jwt_token", jwtToken);

console.log("Lokalnie wygenerowany token JWT:", jwtToken);
