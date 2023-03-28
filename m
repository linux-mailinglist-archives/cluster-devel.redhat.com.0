Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F46CC8FE
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Mar 2023 19:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680023848;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uUmhFgO4DgVeQ/XfsIdy7DmZvXaLy08CKPEqlD1Ap8w=;
	b=AYjIIPPPQslUiTwh0Z77J0CoGQSwi87B2bo7XUI3Ej8OrPa/zEa/B6ZfVpQolGKWa/Vxjx
	1n1Oyt9hObQ493IIG5dBnXbaH4nUrSwFNhIKe2yTVctL4DZIqB0laikZDd8Uzfr77L7kFq
	3+84x+Dc0Ym7IaRIJYqLaMcMJPhzQi0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-J02n0MExOhe01t1EH5HiSg-1; Tue, 28 Mar 2023 13:17:23 -0400
X-MC-Unique: J02n0MExOhe01t1EH5HiSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C03143C0C883;
	Tue, 28 Mar 2023 17:17:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B30FD1121330;
	Tue, 28 Mar 2023 17:17:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A75B1946597;
	Tue, 28 Mar 2023 17:17:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8861C194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Mar 2023 16:19:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 77590440D6; Tue, 28 Mar 2023 16:19:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 704DE440D9
 for <cluster-devel@redhat.com>; Tue, 28 Mar 2023 16:19:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 519742932495
 for <cluster-devel@redhat.com>; Tue, 28 Mar 2023 16:19:06 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-pMPcsbaAMM-yyREHOPtvhA-1; Tue, 28 Mar 2023 12:19:03 -0400
X-MC-Unique: pMPcsbaAMM-yyREHOPtvhA-1
Received: by mail-il1-f200.google.com with SMTP id
 i7-20020a056e021b0700b0031dc4cdc47cso8505292ilv.23
 for <cluster-devel@redhat.com>; Tue, 28 Mar 2023 09:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680020342;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uUmhFgO4DgVeQ/XfsIdy7DmZvXaLy08CKPEqlD1Ap8w=;
 b=ATCy5ay83F2HgedhUia1HdzXTHNZeV0T4Y5IDTRBYxUzGFhcq9nluDQIXi0LCXu1Tf
 Y1OK/cUM3MKIq/3fWftQOUpKu3xx0J7PVzTf1cRgdLEN0i6VRcgLkIBzreANCMqaX4yw
 EexeuaDUQ352PK15BavM0aw6H+ffToJwZVQ931edJplSKYFZ3nuEJhLGGov4USoeXTFC
 XltdrsD+hXoQsRJfRMAGwnVCSLpbuIW9c7x2QtARiTOY42tad+YdBuOkTc2gcoysbb2W
 XuK59SSSU3P+yh5tZK36S6/mWca3EkYQ2BFJIZwT2zMAeGq/C6x0p4OSPbZjNTodr1SS
 0u9Q==
X-Gm-Message-State: AO0yUKW/TgQSNfZr3SLK+L05kjbctrTWFIOXujh9WSmmkWIFV/X1b3nm
 Gzz+ASZHZMe1Ow4QuTRsRMvzdMxYQ7LFm2eVEBUzK4VaOsv8gSg=
X-Google-Smtp-Source: AK7set+a+nG6UvEk6DzS+O8bKQF4xx/PkpBKjqaS27yRXr8A3RZJnR2EZofwn0eShxUNr2MY2VYDxCuO4XPYF4DiC1D2614hCSp5
MIME-Version: 1.0
X-Received: by 2002:a02:7a5d:0:b0:3c4:e84b:2a3a with SMTP id
 z29-20020a027a5d000000b003c4e84b2a3amr6569678jad.4.1680020342682; Tue, 28 Mar
 2023 09:19:02 -0700 (PDT)
Date: Tue, 28 Mar 2023 09:19:02 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bdc7df05f7f837ff@google.com>
From: syzbot <syzbot+list6e220af77940a0f2148c@syzkaller.appspotmail.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 28 Mar 2023 17:17:19 +0000
Subject: [Cluster-devel] [syzbot] Monthly cluster report
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

Hello cluster maintainers/developers,

This is a 30-day syzbot report for the cluster subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/cluster

During the period, 1 new issues were detected and 0 were fixed.
In total, 23 issues are still open and 12 have been fixed so far.

Some of the still happening issues:

Crashes Repro Title
237     Yes   kernel BUG in gfs2_glock_nq (2)
              https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
111     Yes   INFO: task hung in gfs2_jhead_process_page
              https://syzkaller.appspot.com/bug?extid=b9c5afe053a08cd29468
108     Yes   general protection fault in gfs2_evict_inode (2)
              https://syzkaller.appspot.com/bug?extid=8a5fc6416c175cecea34
23      Yes   INFO: task hung in __gfs2_trans_begin
              https://syzkaller.appspot.com/bug?extid=a159cc6676345e04ff7d
21      Yes   WARNING in gfs2_check_blk_type
              https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
18      Yes   UBSAN: array-index-out-of-bounds in __gfs2_iomap_get
              https://syzkaller.appspot.com/bug?extid=45d4691b1ed3c48eba05
13      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
              https://syzkaller.appspot.com/bug?extid=ed7d0f71a89e28557a77
6       No    KMSAN: uninit-value in inode_go_dump
              https://syzkaller.appspot.com/bug?extid=79333ce1ae874ab7ffbb
3       Yes   general protection fault in gfs2_dump_glock (2)
              https://syzkaller.appspot.com/bug?extid=427fed3295e9a7e887f2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

