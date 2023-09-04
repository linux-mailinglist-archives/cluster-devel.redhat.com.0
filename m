Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7179156B
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Sep 2023 12:00:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433--PetXekZNQmHq5KVOYzxqw-1; Mon, 04 Sep 2023 06:00:29 -0400
X-MC-Unique: -PetXekZNQmHq5KVOYzxqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67FC3101A54E;
	Mon,  4 Sep 2023 10:00:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B78A1121314;
	Mon,  4 Sep 2023 10:00:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 39B2019465BC;
	Mon,  4 Sep 2023 10:00:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 358B11946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Sep 2023 08:33:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21CC8C8E4F1; Mon,  4 Sep 2023 08:33:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A5A1C02996
 for <cluster-devel@redhat.com>; Mon,  4 Sep 2023 08:33:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC00A2999B25
 for <cluster-devel@redhat.com>; Mon,  4 Sep 2023 08:33:20 +0000 (UTC)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-eCKI5dL8PXKp44daVDda9g-1; Mon, 04 Sep 2023 04:33:19 -0400
X-MC-Unique: eCKI5dL8PXKp44daVDda9g-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-68a3d6ce18cso1464723b3a.0
 for <cluster-devel@redhat.com>; Mon, 04 Sep 2023 01:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693816398; x=1694421198;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HrGFGOU2JHGHY3uenWpbxy9f+g1nyoQzetE2yd9LSVo=;
 b=bcWTUqRMB2JnYW/GCfLkDLPP5hvm3f3AjXK1VRtbE4FOdZzUiwmS6I/g49W8ij2ZBZ
 QZzHoYogNzwJZVEMgiIuACOdrSnv7+J4GEn8GSVxKr8C7QZOagXwA5M6DxPtW4qTy1R3
 Ejryh3hBO9lQcO04/TFynOtuOsYkj6CnAKih391BMAdsVIpUHYHxGN1Xc787qS0g5vmY
 St0tkrc8WsppALKB99rXtiXwmQrNQMrMNQ27/HKnLyCN5Jgm2LnZJ/HKF0KZFhxTpxQj
 9rebyWWQzK4Q0DPyOVAShFdUZZCDZ0RMhvvueH11ewf6VuUdY3Nz3s1EHnByd7WHvSKX
 ux9w==
X-Gm-Message-State: AOJu0YzL4fkzlXQjcD1ys5urszKcC/dVhoPF2rjnMPKayyC1HSysfEx4
 LHQjH3ZWmbLfKegjwt3J8Aa1WPV15yZdoouf/FSK/qvLprkomJs=
X-Google-Smtp-Source: AGHT+IHDoUNA6dwekWEKHoI4XenoIYPrSAlWMWZ/w4ctM2R+WneLeJWGFR0m8FcLMu7s0rUFMZGrUymlu0Ny03CDBu0dvLMsUbVG
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:98e:b0:68a:5cf8:daf3 with SMTP id
 u14-20020a056a00098e00b0068a5cf8daf3mr3722004pfg.2.1693816397905; Mon, 04 Sep
 2023 01:33:17 -0700 (PDT)
Date: Mon, 04 Sep 2023 01:33:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b644840604845c46@google.com>
From: syzbot <syzbot+list4cf369d7337ac966cd70@syzkaller.appspotmail.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 04 Sep 2023 10:00:27 +0000
Subject: [Cluster-devel] [syzbot] Monthly gfs2 report (Sep 2023)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 0 new issues were detected and 0 were fixed.
In total, 17 issues are still open and 20 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2679    Yes   WARNING in __folio_mark_dirty (2)
                  https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
<2> 577     Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<3> 77      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
                  https://syzkaller.appspot.com/bug?extid=ed7d0f71a89e28557a77
<4> 54      Yes   WARNING in gfs2_check_blk_type
                  https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
<5> 35      Yes   general protection fault in gfs2_dump_glock (2)
                  https://syzkaller.appspot.com/bug?extid=427fed3295e9a7e887f2
<6> 7       Yes   BUG: unable to handle kernel NULL pointer dereference in gfs2_rgrp_dump
                  https://syzkaller.appspot.com/bug?extid=da0fc229cc1ff4bb2e6d
<7> 4       Yes   BUG: unable to handle kernel NULL pointer dereference in gfs2_rindex_update
                  https://syzkaller.appspot.com/bug?extid=2b32df23ff6b5b307565
<8> 1       Yes   BUG: sleeping function called from invalid context in gfs2_make_fs_ro
                  https://syzkaller.appspot.com/bug?extid=60369f4775c014dd1804

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

