Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A31986F57EB
	for <lists+cluster-devel@lfdr.de>; Wed,  3 May 2023 14:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683117093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dzOY9AIDwld6DWL0ECVniyf1GhcTphj+R8EavfMT1hM=;
	b=HHX7sDjLi/XEPdXtTZeHdPBf9bJmbaw7AvOHR855KhfvDX+w4OslJLcdhM7QzYM2+fEgsd
	4YqfC/A/52ruEgF6v7OSILJxCEobY2RAGU7nCVRCko2dEc0Ea/owYSx1Jql+HbIbTj1Aq6
	RQmhYzeCi4ADhh9GOy+8o53GZ8gCnPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-3-U9bb5FPm-SRcbD1L1RBA-1; Wed, 03 May 2023 08:31:32 -0400
X-MC-Unique: 3-U9bb5FPm-SRcbD1L1RBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F09EA1875041;
	Wed,  3 May 2023 12:31:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3A9F2026D16;
	Wed,  3 May 2023 12:31:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FEA31946A42;
	Wed,  3 May 2023 12:31:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 437941946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 30 Apr 2023 08:01:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 34FB3483EC4; Sun, 30 Apr 2023 08:01:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DAD8400F4D
 for <cluster-devel@redhat.com>; Sun, 30 Apr 2023 08:01:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D66C1C05136
 for <cluster-devel@redhat.com>; Sun, 30 Apr 2023 08:01:44 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-i5yRkppgP9-p4iGqI5s6QA-1; Sun, 30 Apr 2023 04:01:42 -0400
X-MC-Unique: i5yRkppgP9-p4iGqI5s6QA-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7606e3c6c8aso78647439f.2
 for <cluster-devel@redhat.com>; Sun, 30 Apr 2023 01:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682841701; x=1685433701;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dzOY9AIDwld6DWL0ECVniyf1GhcTphj+R8EavfMT1hM=;
 b=WNofk9dOgNN+x0kbqsEVD5OhAc2tY2BwPubT09gg0edkttFjbzcvO4GZRf/zUdoqSk
 dZochR5rnChih2qdfKqYDyHP+twkEnkzw/tWRB3SqTMxu3sSRhA8Ziudgo+TDb9NPY9f
 iHp6WIuWvHfARuJ0s++h7X5A2gFqm1lLzoTN0vr3HvN0tn4WRvJ/K+6MO6h6bNw99jdw
 z7sEAInYLI1MjjYF1C2qci04PDGOzETbOln6MUE2niqzOn8y1cGgOl4LmWv0BswBLz1+
 n9HfAv1VFghNt3c/3N1w9iuQOCf3wI4cvOCrCYuiNmEbDyPo2sOzzI6yu2p8dLOZNp3y
 gd+w==
X-Gm-Message-State: AC+VfDyJuhdShSmLw1ypQH8e7ca7377WzldWjncl3fP/w91a3+hrbDX6
 8ds2BdLkBnmAqrY8YlRA0WpQWPdG6wkQAFYMzcge83MtZk/KKF8=
X-Google-Smtp-Source: ACHHUZ68b62ZbfZNQX2uUdpv95IGImoqd3TKpsyalHK5m8wE0nSABqEuouIp+dGOocsLfYbWM4OebFpAwQ1xs3kT3Ar/ZZJ4Ccso
MIME-Version: 1.0
X-Received: by 2002:a02:b10e:0:b0:40f:d134:95d with SMTP id
 r14-20020a02b10e000000b0040fd134095dmr4732420jah.2.1682841701223; Sun, 30 Apr
 2023 01:01:41 -0700 (PDT)
Date: Sun, 30 Apr 2023 01:01:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d0a73c05fa891d24@google.com>
From: syzbot <syzbot+list71347dcb23e4a28f8bf5@syzkaller.appspotmail.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 03 May 2023 12:31:29 +0000
Subject: [Cluster-devel] [syzbot] Monthly gfs2 report (Apr 2023)
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 0 new issues were detected and 0 were fixed.
In total, 19 issues are still open and 17 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1172    Yes   WARNING in __folio_mark_dirty (2)
                  https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
<2> 392     Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<3> 127     Yes   general protection fault in gfs2_evict_inode (2)
                  https://syzkaller.appspot.com/bug?extid=8a5fc6416c175cecea34
<4> 35      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
                  https://syzkaller.appspot.com/bug?extid=ed7d0f71a89e28557a77
<5> 28      Yes   WARNING in gfs2_check_blk_type
                  https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
<6> 23      Yes   INFO: task hung in __gfs2_trans_begin
                  https://syzkaller.appspot.com/bug?extid=a159cc6676345e04ff7d
<7> 13      Yes   general protection fault in gfs2_dump_glock (2)
                  https://syzkaller.appspot.com/bug?extid=427fed3295e9a7e887f2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

