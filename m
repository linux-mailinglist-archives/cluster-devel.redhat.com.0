Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D305872F846
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Jun 2023 10:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686732626;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QvqI8Mn5442slnN4bMkfgcgs+D0vQtmOk1Tmf4jn+oQ=;
	b=iIFdZ+uhqU5VOoajJclCyzP8ohsO13v10Fv2nsx5Oe0geKQ3GpsCEfpRdqYg64Gumwelgg
	tmMKXb0sQT3DIMOnHmjP8nAyK52IGHh2pKERqTy+owZ5eHUQYOMTd1UvGlrt1+dsJX20bW
	SaN+6LQX8c1RyWj50K466LqyWHNppG8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-O4cP0LnxOu6_wijFZym_mA-1; Wed, 14 Jun 2023 04:50:23 -0400
X-MC-Unique: O4cP0LnxOu6_wijFZym_mA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 813D03802132;
	Wed, 14 Jun 2023 08:50:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB3EC2026D20;
	Wed, 14 Jun 2023 08:50:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3E4B219452C4;
	Wed, 14 Jun 2023 08:50:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 81CC8194658C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 14 Jun 2023 08:50:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F2582166B27; Wed, 14 Jun 2023 08:50:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F102166B25
 for <cluster-devel@redhat.com>; Wed, 14 Jun 2023 08:50:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31D5080A0A4
 for <cluster-devel@redhat.com>; Wed, 14 Jun 2023 08:50:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-3d7f7DZaPNaI9Kwh0EUizg-1; Wed, 14 Jun 2023 04:50:17 -0400
X-MC-Unique: 3d7f7DZaPNaI9Kwh0EUizg-1
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f61efe4584so1616e87.1
 for <cluster-devel@redhat.com>; Wed, 14 Jun 2023 01:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686732615; x=1689324615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QvqI8Mn5442slnN4bMkfgcgs+D0vQtmOk1Tmf4jn+oQ=;
 b=ORiQV4sWF2ourPzaev03muvzMnBrrUz4WCyNki7N10NuUK37+Md8Z+N/lLyGxZPKRI
 0eseo13WQJN0V0C4RfoCvxh0pxOKnAWpcQ/aP35+m6GF92sYAg7BgGrhym1BeT1OqbLW
 RuTLWkUrgyMxSum8TwO0s2WZW49QwTcLivgOvN/uuz/h0AEcuFJusX4kTEzCQNVl4FZP
 7XniC04W6PktbGH+4bzIuUHZ/xdUZAwWVDkZ94QOZ/jwL+ZlG04U8H1G36RKHe91oYmL
 dezfe3orJR0JrM9qGfvJyVxcSGnY5vPQGgWVC2ImN9Pi+v8DJnFEIWw55B4A6u0pk6Mx
 OPjw==
X-Gm-Message-State: AC+VfDwU6eoZHwEx02ZycjD3S2JydAuhF7WN2xIInlN5cMNEAjsu/196
 NmjgONBo8eEjg8bNRyUjDDGrvLk/RvY7+fcEZnO7PQ==
X-Google-Smtp-Source: ACHHUZ4Y+C4+ZVih15pjCljP83z9agQjBLGlBmyYJPFm12grpcH5LQ/ivV9kqQ6JOfANpnxixSLHu9LWkBkFoMOHsFY=
X-Received: by 2002:a05:6512:3902:b0:4f6:132d:a9c2 with SMTP id
 a2-20020a056512390200b004f6132da9c2mr37539lfu.3.1686732615291; Wed, 14 Jun
 2023 01:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ab092305e268a016@google.com>
 <000000000000d88b1e05fdf513c3@google.com>
In-Reply-To: <000000000000d88b1e05fdf513c3@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 14 Jun 2023 10:50:03 +0200
Message-ID: <CACT4Y+ZGEucU4yhooRGDia5jxjEb7BhSVh9y9s8UfRzrZapusA@mail.gmail.com>
To: syzbot <syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Jun 2023 at 23:05, syzbot
<syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 504a10d9e46bc37b23d0a1ae2f28973c8516e636
> Author: Bob Peterson <rpeterso@redhat.com>
> Date:   Fri Apr 28 16:07:46 2023 +0000
>
>     gfs2: Don't deref jdesc in evict
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1544372d280000
> start commit:   7df047b3f0aa Merge tag 'vfio-v6.4-rc1' of https://github.c..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=474780ac1e194316
> dashboard link: https://syzkaller.appspot.com/bug?extid=8a5fc6416c175cecea34
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1294d2d2280000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=104a7508280000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: gfs2: Don't deref jdesc in evict

Looks reasonable:

#syz fix: gfs2: Don't deref jdesc in evict

