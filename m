Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F486C9CE4
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Mar 2023 09:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679903728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EXBF2oHmHpd2NV7sQ33KXc5pi0588mwdxTN57DiNNT4=;
	b=fYjCU0u49VRxebS4qu1lybdNykhjqN5v2+1AfxzUOqUIbEf6ST+LHI/7775OTnjwc6S2+T
	+Av9IxHRd0r3oq9zq/351nOJdDQGhxhZVutFeTGc24uUykF5aKcHLBzGyvrmhC441sv3NH
	wrWxOAL5ccZo7sR9OHM/NM3nDeJNgJY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-fb571dY0PuWwxfMjhVSZ1A-1; Mon, 27 Mar 2023 03:55:25 -0400
X-MC-Unique: fb571dY0PuWwxfMjhVSZ1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2587F2A5956F;
	Mon, 27 Mar 2023 07:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF0A24042AC0;
	Mon, 27 Mar 2023 07:55:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE0FE19465A4;
	Mon, 27 Mar 2023 07:55:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 335181946A5A for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Mar 2023 14:43:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF04D492B0B; Fri, 24 Mar 2023 14:43:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D791D492B0A
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 14:43:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD2E43822DF0
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 14:43:29 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-3pUJICShOCu0mFV-LKz4VA-1; Fri, 24 Mar 2023 10:43:27 -0400
X-MC-Unique: 3pUJICShOCu0mFV-LKz4VA-1
Received: by mail-il1-f200.google.com with SMTP id
 z8-20020a92cd08000000b00317b27a795aso1349231iln.0
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 07:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679669007;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EXBF2oHmHpd2NV7sQ33KXc5pi0588mwdxTN57DiNNT4=;
 b=b5EfcZkzo40vvowp7G/wWXSe67N56ppBp/02myzpBvjwB27tEt54oeX2HX4EqQB9J4
 16vt1NZTc4GLuD1sMLWbZKy0XzjJHBqbqsMjcmqEej8WX2qXHwYK5j+Az5kR7AapJ7hw
 LpwuivYTlrpCKP/0aRzBr1Y3tjcfCkoyB6Vje6d1j7wNQTqofWcCWyWJp3HjRo3OMmRh
 YVOiPXAnLrgmfX/pn/DD6oAm2QJ1AZpucbkCRP+RUvZ0yFFETJTCM7ohHy1ZI6KIZvpN
 powSWRARgbxUqm6d52EO0WeMvzntgomdRPaIskQwsTZ4p7EUPTJnkaryZsEGu9Ij++9B
 bISg==
X-Gm-Message-State: AO0yUKV7d62aS1qYT4xSd5e2RD5lUsffWYPqXUB3W8J+fma4cdYzhNeI
 TTGPj7y0ORgwiJMpx2Y5R3RXOFyFmXjfGq/bm6oNUvhH/zkw
X-Google-Smtp-Source: AK7set/eE9N2mdtqK9PkYHONfqdNeHYN7Asa0DB6203yrH9mV9D54z0RfI9Jdxtee+ioISiIZbkKEjfKRdA5mL87+QQRT7WR2SAv
MIME-Version: 1.0
X-Received: by 2002:a02:3314:0:b0:406:2a66:b28c with SMTP id
 c20-20020a023314000000b004062a66b28cmr1045711jae.3.1679669007252; Fri, 24 Mar
 2023 07:43:27 -0700 (PDT)
Date: Fri, 24 Mar 2023 07:43:27 -0700
In-Reply-To: <000000000000b9753505eaa93b18@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000084824b05f7a66a52@google.com>
From: syzbot <syzbot+be899d4f10b2a9522dce@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 27 Mar 2023 07:55:21 +0000
Subject: Re: [Cluster-devel] [syzbot] [cluster?] possible deadlock in
 freeze_super (2)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit b66f723bb552ad59c2acb5d45ea45c890f84498b
Author: Andreas Gruenbacher <agruenba@redhat.com>
Date:   Tue Jan 31 14:06:53 2023 +0000

    gfs2: Improve gfs2_make_fs_rw error handling

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=117e2e29c80000
start commit:   4a7d37e824f5 Merge tag 'hardening-v6.3-rc1' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b969c5af147d31c
dashboard link: https://syzkaller.appspot.com/bug?extid=be899d4f10b2a9522dce
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11484328c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127093a0c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: gfs2: Improve gfs2_make_fs_rw error handling

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

