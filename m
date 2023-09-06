Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860E79377B
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Sep 2023 10:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693990368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F82xWmip9IdB9K1IuccZ0lyqvzI+AMyxxyRv3A0SdbA=;
	b=cTjtAnsvAb5ZG4otZTZZt2450oTKfGnqlkignJ5TxyhO3MmyCdnSZdkB8VEg4v4+rZIW8j
	r7PX/XYCYwh13TFpVFk30uB/jMcd2KpE+8M9qC4OLClCD3/WdNCqGRFCEngfoOF0XIrxey
	8z0eMtQiYUM4fcU2orZ5WboDlBJTqNI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-Lv8bpWcCNr6sifKIjN-Y5Q-1; Wed, 06 Sep 2023 04:52:45 -0400
X-MC-Unique: Lv8bpWcCNr6sifKIjN-Y5Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB3F3C0F685;
	Wed,  6 Sep 2023 08:52:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8ED4B493110;
	Wed,  6 Sep 2023 08:52:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 454D5194658F;
	Wed,  6 Sep 2023 08:52:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE3C91946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 08:46:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8457F140E965; Wed,  6 Sep 2023 08:46:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAC4140E963
 for <cluster-devel@redhat.com>; Wed,  6 Sep 2023 08:46:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 614C9800CA8
 for <cluster-devel@redhat.com>; Wed,  6 Sep 2023 08:46:37 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-gZHrdwAhODiC5Zm09cyEcA-1; Wed, 06 Sep 2023 04:46:35 -0400
X-MC-Unique: gZHrdwAhODiC5Zm09cyEcA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bf24089e4eso46041795ad.1
 for <cluster-devel@redhat.com>; Wed, 06 Sep 2023 01:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693989994; x=1694594794;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F82xWmip9IdB9K1IuccZ0lyqvzI+AMyxxyRv3A0SdbA=;
 b=fbkoDWCedz5f5K7AFZdeVj6NDHXOaH2zdN7Z2uLEBEMxw4gw9Wxnqm4oDfKtWSezcU
 FmKn541taaed7YeBbIBzp3umoiS5f943rzbAu7xFrByHLNx6/bkVCmY1yLRi9l/yuDoI
 CKkwQ4lrJc6mcOlKB94MEFFtoGgUIPIa1SL+KU6e4TqVZpa4pTacryG6W3d0WRb7oA46
 VTU0zYxi6uaITKlEJZITekrgRnhXfjmftTNIEeNp/4TcyVJ1PHegaGSAWg63X5M94mom
 MaJ1MkyH8w/jTomHq0cNtNkkxiYkk+bxsHZCAUhsOg3Ng2mL6j5Bem6F/c8viXIJwVMo
 K0kA==
X-Gm-Message-State: AOJu0YzXvQJ4c0TWtq962z+4nE8lk8WP9ew8cDRGqIEth1g/KZFTP6eS
 fJpgRoW+3eVb31ACD+MKr5+HPYl1cuyfnTYTxmJJHt/rJf32
X-Google-Smtp-Source: AGHT+IERdvXTN0zg2NK9HGOO67xq14GfcjLS9O8KCfPWx8VrJav+JpS5RMKQHJN1Q/BZPwTJBzxRvlw8ZbKcgAIWaJJjbOdOuFmy
MIME-Version: 1.0
X-Received: by 2002:a17:903:1d1:b0:1b8:d44:32aa with SMTP id
 e17-20020a17090301d100b001b80d4432aamr5528873plh.1.1693989994384; Wed, 06 Sep
 2023 01:46:34 -0700 (PDT)
Date: Wed, 06 Sep 2023 01:46:34 -0700
In-Reply-To: <00000000000057049306049e0525@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000de54840604acc740@google.com>
From: syzbot <syzbot+10c6178a65acf04efe47@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rpeterso@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 06 Sep 2023 08:52:42 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] BUG: sleeping function called
 from invalid context in glock_hash_walk
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

commit 0be8432166a61abc537e1247e530f4b85970b56b
Author: Bob Peterson <rpeterso@redhat.com>
Date:   Wed Aug 2 14:24:12 2023 +0000

    gfs2: Don't use filemap_splice_read

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1470c620680000
start commit:   3f86ed6ec0b3 Merge tag 'arc-6.6-rc1' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1670c620680000
console output: https://syzkaller.appspot.com/x/log.txt?x=1270c620680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff0db7a15ba54ead
dashboard link: https://syzkaller.appspot.com/bug?extid=10c6178a65acf04efe47
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e4ea14680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f76f10680000

Reported-by: syzbot+10c6178a65acf04efe47@syzkaller.appspotmail.com
Fixes: 0be8432166a6 ("gfs2: Don't use filemap_splice_read")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

