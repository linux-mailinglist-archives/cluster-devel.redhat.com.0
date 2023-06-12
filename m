Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A440272DF78
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 12:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686652216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7bYNPnFfqHjdFQJOUIEUQGIwD79+AH+aRTvoVJort04=;
	b=KUjwTWM8pzw+5jDG+nhUTjq7vZJIlDNboTUaB27Toc8YSO1KWvzhY0zhg29eO4Y1u1QmxR
	GnehT04L+7gnwj2xx+N/b5vueP2HWrwP6+cEW1+VrDdRgPuIrSImhpjrH+ZAlQJ56uWuSf
	2mAGxeTm7DiLxOvfwmvKh2roWlyEqXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-IG37cizeOMuGkOKxD_o0sw-1; Tue, 13 Jun 2023 06:30:13 -0400
X-MC-Unique: IG37cizeOMuGkOKxD_o0sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F7EC80120A;
	Tue, 13 Jun 2023 10:30:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42DAAC1604C;
	Tue, 13 Jun 2023 10:30:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7EA1C1946A45;
	Tue, 13 Jun 2023 10:30:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7330C194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:05:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2122C2026834; Mon, 12 Jun 2023 21:05:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F5B2026833
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:05:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF0285A5BA
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:05:27 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-7vI6deEnM2-fYpoeC2ku1g-1; Mon, 12 Jun 2023 17:05:26 -0400
X-MC-Unique: 7vI6deEnM2-fYpoeC2ku1g-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-33db528e4faso42808415ab.0
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 14:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686603925; x=1689195925;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7bYNPnFfqHjdFQJOUIEUQGIwD79+AH+aRTvoVJort04=;
 b=dOOxce58pQLIMXb61i4j+OcaLqM637ctwmzHExLOCv2KblPibNe2yHrWjiadTigkvn
 z4DCRDAPElUPRXKYJkEr50kTsqnWspwE2sKWR5PFdsMdEhN+mQyWHXOGIX6zAJ1pgMvw
 Tyc1u8X3CMv22u6IY981uncvCjyN9WZh9OZDddwXlW0QyezAGxLtnYo9krHs8yqkJ2yP
 VxA2aB54sG5eAlOaD7nwrftzt9SqA3kgprouaXnMSV9/DYmYks1FvfU71r6V4oK3mKjH
 6IgYRZg0bU+h1HqFbcGDIj35uKJia1I+ORwq0S6UFfTM7U940vOgQQMObUVwNdS4Tv95
 37OQ==
X-Gm-Message-State: AC+VfDxTlFVZgeANSXEsE3e4OaZp9TaB0f+PpMr+lMhONVgY3TbSeyG1
 ke/mNjqJOiJN0fWYagiyaTjFfj+ABK7QZpEAYp5K5XBRyaZV
X-Google-Smtp-Source: ACHHUZ6MBYUIqF7fHIrkzltsCk1fBPFfysvSY+EZ6WoKhDfGBvSePU/5G9r6nMuObBwYTmZVj6rUoHbL7LuSmWSfcynNp0gI/nhU
MIME-Version: 1.0
X-Received: by 2002:a92:dc09:0:b0:33e:6230:aa65 with SMTP id
 t9-20020a92dc09000000b0033e6230aa65mr5023912iln.0.1686603925323; Mon, 12 Jun
 2023 14:05:25 -0700 (PDT)
Date: Mon, 12 Jun 2023 14:05:25 -0700
In-Reply-To: <000000000000ab092305e268a016@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d88b1e05fdf513c3@google.com>
From: syzbot <syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 13 Jun 2023 10:30:04 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] general protection fault in
 gfs2_evict_inode (2)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 504a10d9e46bc37b23d0a1ae2f28973c8516e636
Author: Bob Peterson <rpeterso@redhat.com>
Date:   Fri Apr 28 16:07:46 2023 +0000

    gfs2: Don't deref jdesc in evict

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1544372d280000
start commit:   7df047b3f0aa Merge tag 'vfio-v6.4-rc1' of https://github.c..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=474780ac1e194316
dashboard link: https://syzkaller.appspot.com/bug?extid=8a5fc6416c175cecea34
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1294d2d2280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=104a7508280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: gfs2: Don't deref jdesc in evict

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

