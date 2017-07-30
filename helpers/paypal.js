var paypal = require('paypal-rest-sdk');

exports.payments = function () {
  paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': 'ASdIHrKE_Szu_k89UfPsn5UC9kAtMk3qOaYUryuTmFUCdT1xeQ8LTiF9c3kwdd3AfRB30_Y9k7NOjsNT',
    'client_secret': 'ELfF7CCRBW8ArKX266uZBN37yXQlMFSx262AiP6ZdQ7eauRRU4CydYnvl9KIuJaJL0z4oALp9yyBg7ez'
  });
};