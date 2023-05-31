Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F871FBBE
	for <lists+cluster-devel@lfdr.de>; Fri,  2 Jun 2023 10:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685694106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=htZDyIEWDuuAVMNaBx1l7dCV0mXn4Xe0g14NDVrYggY=;
	b=MFMxaeE+VAp0wboPjURVK2qzDAVs0uRuxZ/H2Qa9KK8RdcQiN3q3PTmH8PYz2Dk79VKJVB
	T8O5x4hCuQKc/iuAwtih5BqLjoWx/FL+OH8yw4WHUuhsxA1bPVz6xrlUeg+G6trt+gsA/2
	2ynO0e4UlMO2A6zmsR1oicEAh11tQN8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-ohfPs8-IMLus2hJQuNBCbQ-1; Fri, 02 Jun 2023 04:21:43 -0400
X-MC-Unique: ohfPs8-IMLus2hJQuNBCbQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 442693802606;
	Fri,  2 Jun 2023 08:21:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03D06492B0A;
	Fri,  2 Jun 2023 08:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9AE3C19465A2;
	Fri,  2 Jun 2023 08:21:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D3461946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 08:44:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22367112132D; Wed, 31 May 2023 08:44:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B20B112132C
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 08:44:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF7EC3800E8C
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 08:44:20 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-rK5uB7ocOCuclHoq9nnqig-1; Wed, 31 May 2023 04:44:19 -0400
X-MC-Unique: rK5uB7ocOCuclHoq9nnqig-1
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-33b3fa2d560so5744675ab.0
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 01:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685522658; x=1688114658;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=htZDyIEWDuuAVMNaBx1l7dCV0mXn4Xe0g14NDVrYggY=;
 b=cEvvqVL11IZXgEo3GFWAHbzS8xvjGfcqbAubxpmQ3e8ExAvTT+Njn2Y8s1cBd+sOgC
 FHzLMDAWnHJKmXZ8EiJQf49kaRAXhr3Vp5sxEo8cP1Q3g+HMOmMP6WFfLRYf/k6W9l/u
 kHMns1xOZ/iZr0BkI7CYyiDQdknepP+XpQduoZ7jP+Y2mz5etHsVsUKFNMsqYIPkoqri
 AgsNvuN17pUzQKIUc5STuvBOSSlqkPuy5CSmlSfdP/hF+b2e2KjRSguv6d3V9ACb479g
 4Mj9GX7iDbPDkcPOpXpDvan3qX7/rSylnlQTPC0BVZsJXje8T+FdC7OXD17G/Tn4i5gx
 veUg==
X-Gm-Message-State: AC+VfDyzgFYj6YwM7yxZZB7WwC7CdeXiold8OMAmKqptW4aggNBXakHC
 jE8RfQXUqJ4Q9/fKlB9eLlhEr3sPd6dwBIild2uM3H5Rwla0Z5c=
X-Google-Smtp-Source: ACHHUZ5PmMLP+MHrPYj4mzjr8WhT1ThwwXq7MTffBjRXGJ+245Q0WyAL5OWyAs+QbGd7mpGvZ86+7TqNtOuG70ALXiR67vrEiXRr
MIME-Version: 1.0
X-Received: by 2002:a92:db51:0:b0:33b:3d21:7db2 with SMTP id
 w17-20020a92db51000000b0033b3d217db2mr1082394ilq.2.1685522658444; Wed, 31 May
 2023 01:44:18 -0700 (PDT)
Date: Wed, 31 May 2023 01:44:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000051530605fcf95365@google.com>
From: syzbot <syzbot+list419fa0b9f3f2be463473@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Fri, 02 Jun 2023 08:21:39 +0000
Subject: [Cluster-devel] [syzbot] Monthly gfs2 report (May 2023)
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

During the period, 1 new issues were detected and 0 were fixed.
In total, 19 issues are still open and 17 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1592    Yes   WARNING in __folio_mark_dirty (2)
                  https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
<2> 437     Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<3> 51      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
                  https://syzkaller.appspot.com/bug?extid=ed7d0f71a89e28557a77
<4> 34      Yes   WARNING in gfs2_check_blk_type
                  https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
<5> 32      Yes   general protection fault in gfs2_dump_glock (2)
                  https://syzkaller.appspot.com/bug?extid=427fed3295e9a7e887f2
<6> 23      Yes   INFO: task hung in __gfs2_trans_begin
                  https://syzkaller.appspot.com/bug?extid=a159cc6676345e04ff7d
<7> 5       Yes   BUG: sleeping function called from invalid context in gfs2_glock_wait
                  https://syzkaller.appspot.com/bug?extid=cdb448c6e82c20d7960c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

