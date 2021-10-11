Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 62F7C429A05
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Oct 2021 02:00:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-4Ig_I4CzMA-Hf4Vcbb0D-Q-1; Mon, 11 Oct 2021 20:00:05 -0400
X-MC-Unique: 4Ig_I4CzMA-Hf4Vcbb0D-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EDF81006AA4;
	Tue, 12 Oct 2021 00:00:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DD455D9D5;
	Tue, 12 Oct 2021 00:00:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 704FA1801241;
	Mon, 11 Oct 2021 23:59:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BNxqZZ015836 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 19:59:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0DD22026D46; Mon, 11 Oct 2021 23:59:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC73F2026D48
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 23:59:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEFB7185A7A4
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 23:59:49 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-BM0DroPrOgiz1C_Pn7yIIQ-1; Mon, 11 Oct 2021 19:59:48 -0400
X-MC-Unique: BM0DroPrOgiz1C_Pn7yIIQ-1
Received: by mail-lf1-f54.google.com with SMTP id i24so78237798lfj.13
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 16:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OgVSO9l8+qaj3s+luNrigHMuS+kRVTnezRpRHPjbW94=;
	b=Lm5Th9BoZG15TJtjTx/YVVkE/GiVEgh9/HBWhxwkYo/kGItLIGlqKZBTQemqayPPtP
	CJAXPKWV9e7M46ZeZ0567bxQBms6zN3r1qsnA+azf0hPF8rVRLlOj6A6Yh6ate6y9Cym
	wmxRaJEyrCJiQN76IbMh8EBE7284aZs540VB5nt7hwIz1Y18L4P+XL5C4qUOu5awMp4d
	ankmqYmZ0xh5qASAB4Ulk+M6MtiwEFlAcIpyjTYmVnLsrV3yMNnG5nYurLraVNuANDy+
	RDJL5P8YKOnxA8c1g739VeqNkDuSIb/uKANWCBTCTp/tasHxEcMVKdsBFzJWs5ABR1oi
	E8VA==
X-Gm-Message-State: AOAM5338B2gmu0axM3IR8uM1SWICiuzmMmUzXpdLiYJPHGyFZcHMR7A0
	dK2lrXJLlM8r4vxAKBguDpj/CHnOxnn5yIIW
X-Google-Smtp-Source: ABdhPJzVl4IslILYdcNeqpNLk0sl5BE0nNboTCv99zSlV0AjbSLdf1djiCIqwXlnYoHqIATyBeeW5w==
X-Received: by 2002:a05:651c:1615:: with SMTP id
	f21mr25634201ljq.318.1633996786315; 
	Mon, 11 Oct 2021 16:59:46 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
	[209.85.167.52])
	by smtp.gmail.com with ESMTPSA id r3sm866108lfc.169.2021.10.11.16.59.44
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 11 Oct 2021 16:59:44 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id n8so77679522lfk.6
	for <cluster-devel@redhat.com>; Mon, 11 Oct 2021 16:59:44 -0700 (PDT)
X-Received: by 2002:a05:6512:139b:: with SMTP id
	p27mr30802647lfa.173.1633996784057; 
	Mon, 11 Oct 2021 16:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
In-Reply-To: <YWSnvq58jDsDuIik@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 Oct 2021 16:59:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
Message-ID: <CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Will Deacon <will@kernel.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [RFC][arm64] possible infinite loop in btrfs
	search_ioctl()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 11, 2021 at 2:08 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> +#ifdef CONFIG_ARM64_MTE
> +#define FAULT_GRANULE_SIZE     (16)
> +#define FAULT_GRANULE_MASK     (~(FAULT_GRANULE_SIZE-1))

[...]

> If this looks in the right direction, I'll do some proper patches
> tomorrow.

Looks fine to me. It's going to be quite expensive and bad for caches, though.

That said, fault_in_writable() is _supposed_ to all be for the slow
path when things go south and the normal path didn't work out, so I
think it's fine.

I do wonder how the sub-page granularity works. Is it sufficient to
just read from it? Because then a _slightly_ better option might be to
do one write per page (to catch page table writability) and then one
read per "granule" (to catch pointer coloring or cache poisoning
issues)?

That said, since this is all preparatory to us wanting to write to it
eventually anyway, maybe marking it all dirty in the caches is only
good.

                Linus

