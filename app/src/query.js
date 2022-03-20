import { SecretNetworkClient } from "secretjs";

// To create a readonly secretjs client, just pass in an RPC endpoint
const secretjs = await SecretNetworkClient.create(
  "http://localhost:26656",
);

const {
  balance: { amount },
} = await secretjs.query.bank.balance({
  address: "secret16fmuc45z23jxv0fdr6lu7pwm6xn7egw2l4yv87",
  denom: "uscrt",
});

console.log(`I have ${amount / 1e6} SCRT!`);

const {
  codeInfo: { codeHash },
} = await secretjs.query.compute.code(1);

/*
const { motd_info } = await secretjs.query.compute.queryContract({
  address: secret18vd8fpwxzck93qlwghaj6arh4p7c5n8978vsyg,
  codeHash,
  query: { get_motd: {} },
});
*/

//console.log(`MOTD is ${motd_info.motd}!`);

console.log('code hash is ${codeHash}');
