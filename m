Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D45493D4A71
	for <lists+cluster-devel@lfdr.de>; Sun, 25 Jul 2021 00:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627164423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=977uLZZ1MP2YWJkQk/8ziIBF22i/BGM3rYPV0nl730Y=;
	b=ZFeIv7Mk3d51X6109YBdK64jg/ppQZuBUj6fAyCQNVN2IUyAU1f8m6o2vCUoGsjqjP9iDv
	iNbU/ZvRh6LSAKTyowC5K7JZOr0nW3f95FWP60WqEGDY0y6XXBZJw2WYS+WNo92jMcCqGd
	+FMswCM5eXYWEpyV8NQV1X7+3JYG2z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-axjUGsytPB2xcbFOYTZWIw-1; Sat, 24 Jul 2021 18:07:02 -0400
X-MC-Unique: axjUGsytPB2xcbFOYTZWIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 724C1801AE3;
	Sat, 24 Jul 2021 22:07:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 613E219C46;
	Sat, 24 Jul 2021 22:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 485BE4BB7B;
	Sat, 24 Jul 2021 22:07:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OM6vFg032044 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 18:06:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 725032022EC5; Sat, 24 Jul 2021 22:06:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E3CA2022EC3
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 22:06:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12195800FFB
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 22:06:55 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-345-pBRzEExjPiiDc_H2r3Yi2g-1; Sat, 24 Jul 2021 18:06:53 -0400
X-MC-Unique: pBRzEExjPiiDc_H2r3Yi2g-1
Received: by mail-wr1-f70.google.com with SMTP id
	l14-20020a5d560e0000b029013e2b4ee624so2617255wrv.1
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 15:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=977uLZZ1MP2YWJkQk/8ziIBF22i/BGM3rYPV0nl730Y=;
	b=nfgwhNPI0fhOaxS3pUkpesPYqRKrNvBA5zB2nLXloBdB0c35Ol3YmyZHw21X53xR4y
	3vITQxckqTf1S6/75N4pQwaxZVJ6O1dO8+sAyIdsZnZiGOYWMuee6WGaH6l56xhybR9B
	IlgpJvATjvQJeZaN97S9SbJ4Il96IVrW93Zg4Xp2v/raAxP+4hjlAWGdFK9y4KjT1et8
	RzvyF+FR6pkjEy3KjUlAF6jr20jo1WAWAG+ga8Mlp5cRStMVpRhXte56oNu7VXlJi8X8
	XnA8B9fCgu6JpIxpTbw/6N6+462zr+MDOQY3wenasKkI+BG3ie1X6/BJDkYTu5fb00CF
	f9zg==
X-Gm-Message-State: AOAM530hPQlGLjiI+CmJ26Mgcr4jIw+JExaCwXX63ti4Se87WWyJwbQO
	zgUrhWX/G3Qvjd55TKKwSuQGOdns380OCPCHglaqt+6dvdPO2vz5JstrG/6Qa0T6eOuf3tNfw3k
	erwlMK9E9/ButAec7hpzMnuCzs44Hu1wesJchbg==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr3472773wrv.329.1627164412498; 
	Sat, 24 Jul 2021 15:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw98aCqVjWxX38oeHKCaIaIHxY0Om7RKidPStZZN7z95eN6USQN5AiyYEGvql/V+hxUp7+bvK5ucN6W9nHcicg=
X-Received: by 2002:a5d:540d:: with SMTP id g13mr3472762wrv.329.1627164412331; 
	Sat, 24 Jul 2021 15:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
	<CAHc6FU5nGRn1_oc-8rSOCPfkasWknH1Wb3FeeQYP29zb_5fFGQ@mail.gmail.com>
	<YPyMyPCpZKGlfAGk@zeniv-ca.linux.org.uk>
In-Reply-To: <YPyMyPCpZKGlfAGk@zeniv-ca.linux.org.uk>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 25 Jul 2021 00:06:41 +0200
Message-ID: <CAHc6FU4aVL_g3LHEWng1fr8j3jJt+QVK3wAda2q6pfi+xRJcwg@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v4 1/8] iov_iter: Introduce
	iov_iter_fault_in_writeable helper
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

On Sat, Jul 24, 2021 at 11:57 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sat, Jul 24, 2021 at 11:38:20PM +0200, Andreas Gruenbacher wrote:
>
> > Hmm, how could we have sub-page failure areas when this is about if
> > and how pages are mapped? If we return the number of bytes that are
> > accessible, then users will know if they got nothing, something, or
> > everything, and they can act accordingly.
>
> What I'm saying is that in situation when you have cacheline-sized
> poisoned areas, there's no way to get an accurate count of readable
> area other than try and copy it out.
>
> What's more, "something" is essentially useless information - the
> pages might get unmapped right as your function returns; the caller
> still needs to deal with partial copies.  And that's a slow path
> by definition, so informing them of a partial fault-in is not
> going to be useful.
>
> As far as callers are concerned, it's "nothing suitable in the
> beginning of the area" vs. "something might be accessible".

Yes, and the third case would be "something might be accessible, but
not all of it". There probably are callers that give up when they
don't have it all.

Andreas

