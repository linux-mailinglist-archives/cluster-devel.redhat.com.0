Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C37921B5
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 11:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693907860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uKoqPDQ4c4wMdHCcrBupTOrOf6nGa4D/pvESizqweVY=;
	b=M52EiHGNwBGjkDUPHI26pJC96t9yCjqv6lqn/YeVaOyTQz9ZowwSx142TvtH2GOnDvt1eE
	tqAoPnm/zucnKW0VPFfoKZCfJ/024IXEeJ1HW/8m4fK4RV5ZliLuSIH48eB+nNRTroaPxT
	DctpvDZoyfvY/hcK0Qw2h8S6qSoRBlQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-oXpfwZKUMGi1suHKl87RBg-1; Tue, 05 Sep 2023 05:57:39 -0400
X-MC-Unique: oXpfwZKUMGi1suHKl87RBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 512E8181EC24;
	Tue,  5 Sep 2023 09:57:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C251C03291;
	Tue,  5 Sep 2023 09:57:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A45A719465B7;
	Tue,  5 Sep 2023 09:57:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D96819465A2 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 09:57:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36607C03292; Tue,  5 Sep 2023 09:57:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F297C03291
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 09:57:35 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D9E181EC20
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 09:57:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-NkEBJESFOxGA_85-ZJPrdg-1; Tue, 05 Sep 2023 05:57:33 -0400
X-MC-Unique: NkEBJESFOxGA_85-ZJPrdg-1
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso130355e9.0
 for <cluster-devel@redhat.com>; Tue, 05 Sep 2023 02:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693907852; x=1694512652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKoqPDQ4c4wMdHCcrBupTOrOf6nGa4D/pvESizqweVY=;
 b=Vn1X5b1wexks1txqIphJpl4K58FSuOsedMK7VAgPacVlUb5JjFNTaZSQNkBqVS2uyC
 vHswenVM5NUknzb0lNEb9PDoTgQS4B3fvtBcs4kYM71BcVJ0IGdMYqDHd4WW7qG+19b/
 1BDGXYYNgoADf8Vhl7k+0vKwCssBZ2CZfZMZ/rGAofyeiNpbvrdcCsEfw/QDADfWs2Gf
 vhRL43Xc2toNLi/z04D7W+qNq5HGlZ13djRCcNzjqXIyyhzSDK+QVJTzWCOZTAJvTRNf
 d/VpF2UBRAsW85mWVOZXcZoQrHIemrwczgJBBTN7XaA92ECTvjjslIoqcz9abfCnsvZ/
 sTLQ==
X-Gm-Message-State: AOJu0YxdfygzX0qiEwnZ8bxp9HEFtXF0QUbudBwSb4xivKlD7SR4iABD
 /S1d5CesMOiKxS42lLyxoXfHL4s2ogoI1894TsThwg==
X-Google-Smtp-Source: AGHT+IFvBTvFUF7R7ANkYgde9PIYsgXPp7fox9gwEeYNhLFnCB3TvKs0r2mns8WNAIXVHQWCoxvSCOzyVDapcZgHkxc=
X-Received: by 2002:a05:600c:1c25:b0:400:c6de:6a20 with SMTP id
 j37-20020a05600c1c2500b00400c6de6a20mr241680wms.3.1693907851956; Tue, 05 Sep
 2023 02:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000050a49105f63ed997@google.com>
 <000000000000fe1297060492eb88@google.com>
In-Reply-To: <000000000000fe1297060492eb88@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 5 Sep 2023 11:57:20 +0200
Message-ID: <CANp29Y4nitnu-iF77=8rNH_k02=N_1+C7C-ix_1XmpMsf1A=BA@mail.gmail.com>
To: syzbot <syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] general protection fault in
 gfs2_dump_glock (2)
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
Cc: elver@google.com, peterz@infradead.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, valentin.schneider@arm.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, no, it might theoretically be that preemption affected bug
reproducibility, but this commit itself definitely has nothing to do
with the gfs2 problem.

On Tue, Sep 5, 2023 at 3:55=E2=80=AFAM syzbot
<syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit a8b76910e465d718effce0cad306a21fa4f3526b
> Author: Valentin Schneider <valentin.schneider@arm.com>
> Date:   Wed Nov 10 20:24:44 2021 +0000
>
>     preempt: Restore preemption model selection configs
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1633aaf068=
0000
> start commit:   58390c8ce1bd Merge tag 'iommu-updates-v6.4' of git://git.=
k..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1533aaf068=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1133aaf068000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5eadbf0d3c2ec=
e89
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D427fed3295e9a7e=
887f2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D172bead8280=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D14d01d0828000=
0
>
> Reported-by: syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com
> Fixes: a8b76910e465 ("preempt: Restore preemption model selection configs=
")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>

