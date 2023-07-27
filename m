Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B891766949
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jul 2023 11:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690537803;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1rPvaF6OOJ/U+YAeLPtcgmuDs5ZebXxvGSINN1V35cM=;
	b=K8XFQsZDISJv9G8aiSQc+DE5yOCOI9l9QfrD3U9q5cgEP7MfDM5Bh6y7sNbQwv6nEZEjqR
	BbM9+sY/wY4Oso9rg8OxyTQ1Tk3D+Nk8pjzznvdRou0j4+nkrKstCqkWQURlXUKiYPiDpU
	HTzuwq8p/vkrjp0IH9oa1WDhhWNGyv4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-CNJfI_NsMAWtvO1EqZGiSw-1; Fri, 28 Jul 2023 05:50:00 -0400
X-MC-Unique: CNJfI_NsMAWtvO1EqZGiSw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 030083810783;
	Fri, 28 Jul 2023 09:49:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C47F3492CA6;
	Fri, 28 Jul 2023 09:49:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4E8771946A6E;
	Fri, 28 Jul 2023 09:49:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 543F81946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 23:14:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA4EB492B03; Thu, 27 Jul 2023 23:14:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A294D492B02
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 23:14:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 861C7104458E
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 23:14:31 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-_XJGqeiYMxaG9yxq3osbcg-1; Thu, 27 Jul 2023 19:14:29 -0400
X-MC-Unique: _XJGqeiYMxaG9yxq3osbcg-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3a5ab2d29bbso3091714b6e.0
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 16:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690499669; x=1691104469;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1rPvaF6OOJ/U+YAeLPtcgmuDs5ZebXxvGSINN1V35cM=;
 b=Tf07xT6eojoKmF45UAF3cV46JILc2Rkq0jrQA3i64XwgO7nwqMWIXX4lwgWbtNzsGl
 zp7M6fsx9IIAZFrLSB62BS6Q8hxPEn/x2gTnzwPJ1+1bsRWSCnzzj+EFlzhbqE3Gf8G5
 issso+W2sK0OeYqeXVR80L5FZI4/OVMOUsxNXFoz6/6kmcrp3G2VPiDjb2loCk8vsO67
 j2PWqMCVu+USKnoyQ5zbquXPyaGcCQw9OCab0h8F/73OxYqw2CIeIrd2apWID5OC7FDh
 VuqbA0QYy9w92f/3QA7ajje5Qebc0wVGz9cAMTJMRGuLmSLhDkivxclZVj+2GwB8Cuhm
 e/jA==
X-Gm-Message-State: ABy/qLbSpCc5JBRZMtpgdBJUyH3ASnp5UR/D58UyCzBzwJa6Kbor5r8u
 Hr7GMSMKkpN8Zf03QXnvmqH1a9GKyt7W7RsC+/8Qw2N94iRo
X-Google-Smtp-Source: APBJJlEW3A9Hylxq1g07WDmdfR32/vGq1EVapb5OIXuzXwTElrsjV1PAQHPcVWawdzwRYS3XtenGxKggp6cwPaHdP5tcaCjiHkHc
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1305:b0:3a1:e88d:98b9 with SMTP id
 y5-20020a056808130500b003a1e88d98b9mr1342693oiv.7.1690499669138; Thu, 27 Jul
 2023 16:14:29 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:14:29 -0700
In-Reply-To: <0000000000000cf7de0601056232@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000045a44b0601802056@google.com>
From: syzbot <syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com>
To: agruenba@redhat.com, arnd@arndb.de, cluster-devel@redhat.com, 
 dhowells@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rpeterso@redhat.com, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Fri, 28 Jul 2023 09:49:55 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] kernel panic: hung_task:
 blocked tasks (2)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 9c8ad7a2ff0bfe58f019ec0abc1fb965114dde7d
Author: David Howells <dhowells@redhat.com>
Date:   Thu May 16 11:52:27 2019 +0000

    uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=169b475ea80000
start commit:   fdf0eaf11452 Linux 6.5-rc2
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=159b475ea80000
console output: https://syzkaller.appspot.com/x/log.txt?x=119b475ea80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27e33fd2346a54b
dashboard link: https://syzkaller.appspot.com/bug?extid=607aa822c60b2e75b269
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11322fb6a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17687f1aa80000

Reported-by: syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com
Fixes: 9c8ad7a2ff0b ("uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

