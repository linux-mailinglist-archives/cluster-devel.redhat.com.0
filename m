Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4F063D6584
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:16:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-KCmyvqgOM7WhlqlqavQUWQ-1; Mon, 26 Jul 2021 13:16:01 -0400
X-MC-Unique: KCmyvqgOM7WhlqlqavQUWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F462EC1A1;
	Mon, 26 Jul 2021 17:15:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA4D5DD86;
	Mon, 26 Jul 2021 17:15:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D515D4BB7C;
	Mon, 26 Jul 2021 17:15:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHFuEu022894 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:15:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7B972156601; Mon, 26 Jul 2021 17:15:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3610215673F
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:15:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BF6696B053
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:15:54 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-603-gygi8JKNMrG3oQIKXX0-tw-1; Mon, 26 Jul 2021 13:15:52 -0400
X-MC-Unique: gygi8JKNMrG3oQIKXX0-tw-1
Received: by mail-lf1-f45.google.com with SMTP id z2so16845785lft.1
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 10:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9nCFSPU1gol0E4rDrQO0oADKpQ2235snVgYBEAYRF9Y=;
	b=BgdDnulLiqTtRNlKP3iMwpXLVv8gE3WhwJthcZq7+Zj7a9n8h4NMcYgnLYSI4du65x
	88rrqeaX+sF/PLJuP68GQZ5DzQ1Ov4MRd/5QP6jQV/ikOXG/RdQOD4FqqBu9UMrYiaDv
	WgdGX+ornda9WKS0ziO67DnEXnKCNPElsy3GRXIYuzGgOiZZtlQUwSxTx0aaqWiAo5PS
	wliHf5gwbjzhPPerwfvTq6fbaG8IINn+wU6hwiD+FTbN2/pwOkDp/KLHhosWYn+Q4Bqa
	G8HDtbCNUx2IiIBAdE4hgu54xcUBVE7Shh6/2cJNu7ZpZ+F/JAGojVwCzHcgZRVAhzwV
	r0mw==
X-Gm-Message-State: AOAM530vX7PZ1u3k0BDIGhBhgvOBEQrMxzzI2mazVhwGjvTjxqBxcqj4
	xQsM5ZVif2kg54YzN8kpFcv4njpUYU/eUjxT
X-Google-Smtp-Source: ABdhPJwDX7PmFP9/CQammVwGnTTEinRnl3paRm8E8dV5Nfsiyib7T7xnrVDw1b/hKXVcPJetmi1Bxw==
X-Received: by 2002:a19:c7c3:: with SMTP id
	x186mr13799641lff.219.1627319750429; 
	Mon, 26 Jul 2021 10:15:50 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
	[209.85.208.177])
	by smtp.gmail.com with ESMTPSA id b13sm20162ljq.53.2021.07.26.10.15.47
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 26 Jul 2021 10:15:48 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id a7so12158781ljq.11
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 10:15:47 -0700 (PDT)
X-Received: by 2002:a2e:3212:: with SMTP id y18mr12834084ljy.220.1627319747365;
	Mon, 26 Jul 2021 10:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-2-agruenba@redhat.com>
	<20210726163326.GK20621@quack2.suse.cz>
In-Reply-To: <20210726163326.GK20621@quack2.suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Jul 2021 10:15:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqOZmRT_gmAS+K9sA7EYCKM9BYzvJMhy1_P6JaaVGvfA@mail.gmail.com>
Message-ID: <CAHk-=wgqOZmRT_gmAS+K9sA7EYCKM9BYzvJMhy1_P6JaaVGvfA@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 1/7] iov_iter: Introduce
	fault_in_iov_iter helper
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

On Mon, Jul 26, 2021 at 9:33 AM Jan Kara <jack@suse.cz> wrote:
>
> On Fri 23-07-21 22:58:34, Andreas Gruenbacher wrote:
> > +     gup_flags = FOLL_TOUCH | FOLL_POPULATE;
>
> I don't think FOLL_POPULATE makes sense here. It makes sense only with
> FOLL_MLOCK and determines whether mlock(2) should fault in missing pages or
> not.

Yeah, it won't hurt, but FOLL_POPULATE doesn't actually do anything
unless FOLL_MLOCK is set. It is, as you say, a magic flag just for
mlock.

The only ones that should matter are FOLL_WRITE (for obvious reasons)
and FOLL_TOUCH (to set the accessed and dirty bits, rather than just
th protection bits)

                   Linus

