import { createApp } from 'vue'
import App from './App.vue'
import { SecretNetworkClient } from "secretjs";

import { SecretNetworkClient } from "secretjs";

const SECRET_RPC = 'http://localhost:26657';
const CONTRACT = 'secret18vd8fpwxzck93qlwghaj6arh4p7c5n8978vsyg';
const CODE_HASH = '';
const CHAIN_ID = 'secretdev-1';

// To create a readonly secretjs client, just pass in an RPC endpoint
const secretjs = await SecretNetworkClient.create(SECRET_RPC);

const { motd } = await secretjs.query.compute.queryContract({
  address: CONTRACT,
//  codeHash: CODE_HASH, // optional but way faster
  query: { get_motd: {} },
});

console.log(`MOTD is ${motd}!`);

createApp(App).mount('#app')

