# Basic Intro
<a href="https://github.com/DennyZhang?tab=followers"><img align="right" width="200" height="183" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/fork_github.png" /></a>

[![LinkedIn](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/linkedin.png)](https://www.linkedin.com/in/dennyzhang001) <a href="https://www.dennyzhang.com/slack" target="_blank" rel="nofollow"><img src="http://slack.dennyzhang.com/badge.svg" alt="slack"/></a> [![Github](https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/github.png)](https://github.com/DennyZhang)

File me [tickets](https://github.com/DennyZhang/challenges-script/issues) or star [the repo](https://github.com/DennyZhang/challenges-script).

**Similar Challenges**: https://www.dennyzhang.com/battle

| Name                         | Comment                                                          |
| :----------------------      | ---------------------------------------------------------------- |
| Trap exit signal             | [code/trap_exit.sh](code/trap_exit.sh)                           |
| Redirect stdout/stderr       | `ls /tmp 1>/dev/null 2>&1`                                       |
| Compare command output       | `[ 0 -eq $(find ./data -name "*.txt" -type f -print ｜ wc -l) ]` |
| Deal with filename           | `basename $f`, `dirname $f`                                      |
| Long option for command line | [code/long_option_parameter.sh](code/long_option_parameter.sh)   |
| timeout command              | `timeout 10 sh -c "ls -lt"`                                      |



# Scripts

- get ip from eth0

```
/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
```

# Contributors
Below are folks who have contributed via GitHub!
- TODO:

# License
- Code is licensed under [MIT License](https://www.dennyzhang.com/wp-content/mit_license.txt).

<a href="https://www.dennyzhang.com"><img align="right" width="201" height="268" src="https://raw.githubusercontent.com/USDevOps/mywechat-slack-group/master/images/denny_201706.png"></a>
