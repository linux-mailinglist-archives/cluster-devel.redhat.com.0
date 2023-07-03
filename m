Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1F74D45C
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Jul 2023 13:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688987777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XUPdwdtrTpIQ8DyX7P3KMSYQAYCJn93KuO0ivGJvg7I=;
	b=SokOAj8oQTaxGown2qiNatoxv1EwZ+u71/WugjegTFwOZl/6LGh1G8aEko+aPnTgFkgg0h
	sdIpLFm8teF7R7Cfp9Rsc7Lw5WOen4uJDS60KmrbQP39U0d39zIsjwWBu11rUr4fHgwX7y
	0EaTuM7NSaffWY3oIjnsu05UBRE+2e4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-kd7Okc5DNqqbG-BDBI0yGw-1; Mon, 10 Jul 2023 07:16:14 -0400
X-MC-Unique: kd7Okc5DNqqbG-BDBI0yGw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A903804504;
	Mon, 10 Jul 2023 11:16:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13D654CD0C6;
	Mon, 10 Jul 2023 11:16:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A0DB419465B2;
	Mon, 10 Jul 2023 11:16:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 72AFF1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  3 Jul 2023 09:03:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1C7321121315; Mon,  3 Jul 2023 09:03:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1525C1121314
 for <cluster-devel@redhat.com>; Mon,  3 Jul 2023 09:03:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC033C025D1
 for <cluster-devel@redhat.com>; Mon,  3 Jul 2023 09:03:54 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-OQvhbz2mPG-D8LsALoZjZA-1; Mon, 03 Jul 2023 05:03:53 -0400
X-MC-Unique: OQvhbz2mPG-D8LsALoZjZA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1b8071502d2so59709135ad.2
 for <cluster-devel@redhat.com>; Mon, 03 Jul 2023 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688375032; x=1690967032;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XUPdwdtrTpIQ8DyX7P3KMSYQAYCJn93KuO0ivGJvg7I=;
 b=F6xCFahgFrOy8quLzfiN6yyqqG4aCnLZTmt4to071lOYODdhbv8hmDCyM8LJ+e0vrR
 8+8mTumvzsooKFoMZAvoiq2e7NAWDX5h1eiDq644vVyzyFyXymbHmYFd6rP7VXB4Mc+z
 BPguixBfPZJ/uTwEzXKdKHEl3ey+5nhpbDM0VSEq5YwGhTLJjBm8mJ2wS1Z8JrajHf7z
 +12HuHNCPgQ7Kqed4DBlqdZmrjyzZO7IFtbWOKRfQ+vScPcTvZsHLUIfWY+5P34z34Rq
 qQ2tfUYmdAT01kn1Z9NpF1qRynwxYRkF5YWGGoOC1ANITFgfASAizOKSr0Mm6W89F6DT
 L67Q==
X-Gm-Message-State: ABy/qLb95nI+ZfnJGxgK/Ww5EZW/khLmGC8xTIigsy7w4aPFduPMzfN/
 JrO6i0ym8XoapAaj1AoTIlPESKF8SL0ETIz6H+pf3OjEQ3ZWm+U=
X-Google-Smtp-Source: APBJJlFpfyewi9QZtFHslT00sOHjSKSCz6bxrK8TzXeSM8sC2CA+FThBBM6EWDfZhqMIxZABboOQhWSLgKJmysbPxawqkJQbj9a4
MIME-Version: 1.0
X-Received: by 2002:a17:902:d2cd:b0:1b7:d4d2:c385 with SMTP id
 n13-20020a170902d2cd00b001b7d4d2c385mr8066594plc.1.1688375032039; Mon, 03 Jul
 2023 02:03:52 -0700 (PDT)
Date: Mon, 03 Jul 2023 02:03:51 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000084dec05ff9172d0@google.com>
From: syzbot <syzbot+listc7ee81020a261332735b@syzkaller.appspotmail.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 10 Jul 2023 11:16:06 +0000
Subject: [Cluster-devel] [syzbot] Monthly gfs2 report (Jul 2023)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 0 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 18 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2103    Yes   WARNING in __folio_mark_dirty (2)
                  https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
<2> 479     Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<3> 59      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
                  https://syzkaller.appspot.com/bug?extid=ed7d0f71a89e28557a77
<4> 44      Yes   WARNING in gfs2_check_blk_type
                  https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
<5> 4       Yes   KASAN: use-after-free Read in qd_unlock (2)
                  https://syzkaller.appspot.com/bug?extid=3f6a670108ce43356017

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

