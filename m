Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A987978C082
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1TELWkyWGLVi5ounuTr86ov170s+tD6p0uOdCZdYqIw=;
	b=Tr7wxKUMtt8b/9Jh3T1bSDb2BNgCgtkTEXHFI5AzIN+arTe8q5roJ56GeCOAumE8L7HH51
	8ZpqL5N5Fzv7jvROvHH/bOG+05pP6wOJPqPgFOkWNfu/HXmmMVs8fYygFOEMuDwmn08XMM
	4r207uKmAKyNxE/Aayr2Oro5i/zopRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-juxmcELfMOmUup15doCHmA-1; Tue, 29 Aug 2023 04:41:11 -0400
X-MC-Unique: juxmcELfMOmUup15doCHmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C630101CC97;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90E3E140E962;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B45BC19452C4;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 496731946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 00:46:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1375E6B2B3; Tue, 29 Aug 2023 00:46:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C787568FF
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 00:46:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1184101A528
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 00:46:35 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-QAMT3l1mOueCzZZcHBQ3aQ-1; Mon, 28 Aug 2023 20:46:33 -0400
X-MC-Unique: QAMT3l1mOueCzZZcHBQ3aQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1c0888c175fso35488635ad.3
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 17:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693269993; x=1693874793;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1TELWkyWGLVi5ounuTr86ov170s+tD6p0uOdCZdYqIw=;
 b=Ox6sOqoYNY5HKDa0/O6ArfMz4IqO4R4g4sdQrlMLg3Wx4Rrtv1aoKoaRBObXTS5GQt
 uB6YsBENmjVHWi5tHzbVIR11+oSjIw5M8DHwUbleDiMIVjJF8RkBEiSZDS2QDWEe7xO8
 Fehf6mDtF9hgDjzDXF5GKtOZIk/d2gk9p2rPeqX1FaNe55r1WHjLnYh3Pjk0CjcFqkKa
 s7tUlJrzUUUxz8hucruRePv7Uj5dcxFe+c8l3CRPOyRrKiYPsWZ6sj5xReTXtrMOYRzu
 sZsrCbh0xoQekDgAmx8cwrI+wB+F0ce4/PjnMM8YuRSCOJ3aaDzrM1Nwl/oDPr3bt+v3
 PDWQ==
X-Gm-Message-State: AOJu0YzYWCqZBZkMisNOSUb3gGkl5kFfpZrRIPUXUedXqPhjXcKPrrEI
 PaV0gEEnFW/c8Rg9vpYEOImO+Wcr8drzbEHqnLupMTFQQ+oT
X-Google-Smtp-Source: AGHT+IF0JqiW6n0JfvqO2k1I/9t1jQO8AG2MUpQEzvKAMNeahZVregfHFtJaSp9GCQxOa4QV8OAF+1E4K+uL66L95sGp4DDSIsgt
MIME-Version: 1.0
X-Received: by 2002:a17:902:f353:b0:1bc:a3b:e902 with SMTP id
 q19-20020a170902f35300b001bc0a3be902mr7730501ple.3.1693269992834; Mon, 28 Aug
 2023 17:46:32 -0700 (PDT)
Date: Mon, 28 Aug 2023 17:46:32 -0700
In-Reply-To: <000000000000b37bea05f0c125be@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006e8bd80604052481@google.com>
From: syzbot <syzbot+da0fc229cc1ff4bb2e6d@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rpeterso@redhat.com, swhiteho@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] BUG: unable to handle kernel
 NULL pointer dereference in gfs2_rgrp_dump
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 72244b6bc752b5c496f09de9a13c18adc314a53c
Author: Bob Peterson <rpeterso@redhat.com>
Date:   Wed Aug 15 17:09:49 2018 +0000

    gfs2: improve debug information when lvb mismatches are found

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1593747ba80000
start commit:   0a924817d2ed Merge tag '6.2-rc-smb3-client-fixes-part2' of..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1793747ba80000
console output: https://syzkaller.appspot.com/x/log.txt?x=1393747ba80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e2d7bfa2d6d5a76
dashboard link: https://syzkaller.appspot.com/bug?extid=da0fc229cc1ff4bb2e6d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e5bf7f880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13952f5d880000

Reported-by: syzbot+da0fc229cc1ff4bb2e6d@syzkaller.appspotmail.com
Fixes: 72244b6bc752 ("gfs2: improve debug information when lvb mismatches are found")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

