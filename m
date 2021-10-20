Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89C435463
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Oct 2021 22:12:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-KNc8BxoVMZCXeiWzNmRw4w-1; Wed, 20 Oct 2021 16:11:58 -0400
X-MC-Unique: KNc8BxoVMZCXeiWzNmRw4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA3A101AFA7;
	Wed, 20 Oct 2021 20:11:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BAA19D9F;
	Wed, 20 Oct 2021 20:11:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3658180BAD2;
	Wed, 20 Oct 2021 20:11:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KKBkHo006140 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 16:11:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 06A7311558B6; Wed, 20 Oct 2021 20:11:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0252711558B5
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 20:11:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12959811E7F
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 20:11:41 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-72ok5bmLPP6w5w3FPtLcJg-1; Wed, 20 Oct 2021 16:11:39 -0400
X-MC-Unique: 72ok5bmLPP6w5w3FPtLcJg-1
Received: by mail-lj1-f182.google.com with SMTP id s19so144862ljj.11
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 13:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2mjyTuiMt0G/NI9j2uGhr176LQ8tHUDaZsPCBpnXywo=;
	b=0PhxfEHaC21Rk3D4MnE10QSG6hprxyB6Jwqw5Qo8PkrUE5Poh1FRzcfTsFkH+3AhAv
	G8R+SEYGEEVmtawTfW/t687Tt9rGi2z3YYTVTLZiW83M7Ymbb6v8+MkIX4w1YAlykGlP
	AZeZhMWK6BoAQzsaB5VeeimwJ9anpk3A2r3872JXJ4/Ex4qhkHlaG784B+OeJEOZ9Gsm
	/+/6Cg5So4u0epxzqkpcIiLj9RoSuLr8CuYb5tePvnC+icLaEPzpImQPYIxxeUeAtEWj
	0kZkGbPQuVGAMmGOuIZEpzUlCyORyza4bMLD3rH+jyYoXa3tbIBliJFWWqlhSIfSo54p
	urKg==
X-Gm-Message-State: AOAM532+d0tLnsl/B6GTwW9pZ29gBDrz2p7+OdyN7yhDaUfDsDDK5zaA
	KZAThunxGxCGLqnDVziy0Iq7WInqsR6c8Z9e
X-Google-Smtp-Source: ABdhPJzV1EGlx5VdAH1ehVxJvBQ+J415WdEU/8IGffbfZEJwKmSYMq5DTWNlr/82f0rurTkEOm6Qlg==
X-Received: by 2002:a2e:8786:: with SMTP id n6mr1184712lji.331.1634760697278; 
	Wed, 20 Oct 2021 13:11:37 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
	[209.85.208.179])
	by smtp.gmail.com with ESMTPSA id 2sm270150lfz.145.2021.10.20.13.11.35
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 20 Oct 2021 13:11:36 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id l5so75544lja.13
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 13:11:35 -0700 (PDT)
X-Received: by 2002:a2e:9945:: with SMTP id r5mr1210626ljj.249.1634760695569; 
	Wed, 20 Oct 2021 13:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
In-Reply-To: <YXBFqD9WVuU8awIv@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 20 Oct 2021 10:11:19 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
Message-ID: <CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 6:37 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> The atomic "add zero" trick isn't that simple for MTE since the arm64
> atomic or exclusive instructions run with kernel privileges and
> therefore with the kernel tag checking mode.

Are there any instructions that are useful for "probe_user_write()"
kind of thing? We could always just add that as an arch function, with
a fallback to using the futex "add zero" if the architecture doesn't
need anything special.

Although at least for MTE, I think the solution was to do a regular
read, and that checks the tag, and then we could use the gup machinery
for the writability checks.

                Linus

