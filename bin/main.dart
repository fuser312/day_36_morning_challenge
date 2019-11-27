/// Challenge
/// Accounts Merge
// Given a list accounts, each element accounts[i] is a list of strings, where
// the first element accounts[i][0] is a name, and the rest of the elements are
// emails representing emails of the account.
//
// Now, we would like to merge these accounts. Two accounts definitely belong to
// the same person if there is some email that is common to both accounts. Note
// that even if two accounts have the same name, they may belong to different people
// as people could have the same name. A person can have any number of accounts
// initially, but all of their accounts definitely have the same name.
//
// After merging the accounts, return the accounts in the following format: the
// first element of each account is the name, and the rest of the elements are
// emails in sorted order. The accounts themselves can be returned in any order.
/// Example 1:
/// Input:
// accounts = [["John", "johnsmith@mail.com", "john00@mail.com"],
// ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
// ["Mary", "mary@mail.com"]]
/// Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],
/// ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]

List<List<String>> mergeAccounts(List<List<String>> accounts){
 for (int i = 0; i < accounts.length; i++) {
    for (int j = 0; j < accounts.length; j++) {
      if (i != j) {
        if (commonMails(accounts[i], accounts[j])) {
          accounts[i] = userWithCommonMails(accounts[i], accounts[j]);
          accounts.removeAt(j);
          j=0;
        }
      }
    }
  }
  return accounts;
}

bool commonMails(List<String> firstAccount, List<String> secondAccount) {
  for (int i = 1; i < firstAccount.length; i++) {
    for (int j = 1; j < secondAccount.length; j++) {
      if (firstAccount[i] == secondAccount[j]) {
        return true;
      }
    }
  }
  return false;
}

List userWithCommonMails(List<String> firstAccount, List<String> secondAccount) {
  List<String> commonMails = [];
  firstAccount.forEach((mails) {
    if (firstAccount.indexOf(mails) != 0 && !(commonMails.contains(mails))) {
      commonMails.add(mails);
    }
  });
  secondAccount.forEach((mails) {
    if (secondAccount.indexOf(mails) != 0 && !(commonMails.contains(mails))) {
      commonMails.add(mails);
    }
  });
  commonMails.sort();
  commonMails.insert(0, firstAccount[0]);
  return commonMails;
}

        


main() {

  print(mergeAccounts([
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"],
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["Mary", "mary@mail.com"]
  ]));
}
