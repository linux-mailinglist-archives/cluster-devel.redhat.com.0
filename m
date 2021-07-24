Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 321FD3D4A23
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 23:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627162730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=OQ9nYZF7TCv1Im5A1JNzguL1rttUs8MvyEizhk+cJ88=;
	b=EtF9/fn67M8HyjjFthv0A8MJ2WwxDKvEduNXsrhCi1a5jJxVBmUHakMR6OwfDzQXnJVRZl
	cMk94DwYaFZgLEIgrR0W3a38Xe3Zo9c4hvymsXxGCM9Jk24aO4dVPM4FKlOzjHAOY4lbhr
	921H9eqzg7wB2X7QjM0Z7pO+vXgjYHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-qzyO2aXVPm2v6o7MlGmeWQ-1; Sat, 24 Jul 2021 17:38:49 -0400
X-MC-Unique: qzyO2aXVPm2v6o7MlGmeWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC8421006C82;
	Sat, 24 Jul 2021 21:38:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 165715C1D0;
	Sat, 24 Jul 2021 21:38:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4E1B180BAB1;
	Sat, 24 Jul 2021 21:38:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OLcb0L028884 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 17:38:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2065200B69F; Sat, 24 Jul 2021 21:38:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE0C9200BA83
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 21:38:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B865866DF5
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 21:38:34 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-178-rR4WKgAQO7WsAupuTVEVfQ-1; Sat, 24 Jul 2021 17:38:33 -0400
X-MC-Unique: rR4WKgAQO7WsAupuTVEVfQ-1
Received: by mail-wr1-f71.google.com with SMTP id
	v16-20020adfa1d00000b02901401e436a18so2516473wrv.21
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 14:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OQ9nYZF7TCv1Im5A1JNzguL1rttUs8MvyEizhk+cJ88=;
	b=bxlADmX55kylwGbst1owymBKYoIbUwm7gxhaNP1b4cT6z0OBjeSIHB5s0pp4U8+CAC
	bVGJondYOD/03nEL7RZgtr9di2JqFJb1FkwagpaXIqUY9KwlTLnOr1Qgj1TBJu5BKgqA
	bzrc6d5OZKQinSr5silJaDxp/OVSjykFzBHs/hiHd91YzNinzGUr/d9g+Uax27IbMgKJ
	hUUrXir2yl1xKAza6sEzQQmTyXla7+Aoteh5Dtc+shFIOsviHhaRX5GmE7KRm7XzUqq4
	JAgMklUYeLSkmBW+qYN/5dPvQubAiSDvCCvn9ubgAgEoHT4YPXX+VTf53b0oha5bC/+p
	DK6A==
X-Gm-Message-State: AOAM531aYM6RRh8Hha0aB4coH1pyB7NJQrboeRhXdwZVprTQzYzyzy9E
	p7yKBBR3zXXPIsdqIvFq6jS0GnvVyE5aQHzPQNigqlhka3DcsNsPI5CuoAwgNoK7IB5Xn1mnTMf
	W6F1U0SM6sKI1RU4qB2oH7UAkCGLKdx0vYUG/8g==
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr11408637wrp.211.1627162711891;
	Sat, 24 Jul 2021 14:38:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Kv/M6qskCAa2iYidDcO94F9rO3w70hsI/xsveCv4ij53/4AEZQooofItTEg7clN8/LfjbNCETI0gEwwmduY=
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr11408629wrp.211.1627162711767;
	Sat, 24 Jul 2021 14:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
In-Reply-To: <YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 24 Jul 2021 23:38:20 +0200
Message-ID: <CAHc6FU5nGRn1_oc-8rSOCPfkasWknH1Wb3FeeQYP29zb_5fFGQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 24, 2021 at 10:24 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sat, Jul 24, 2021 at 12:52:34PM -0700, Linus Torvalds wrote:
> > ...
> > > +                       if (fault_in_user_pages(start, len, true) != len)
> > > +                               return -EFAULT;
> >
> > Looking at this once more, I think this is likely wrong.
> >
> > Why?
> >
> > Because any user can/should only care about at least *part* of the
> > area being writable.
> >
> > Imagine that you're doing a large read. If the *first* page is
> > writable, you should still return the partial read, not -EFAULT.
>
> Agreed.
>
> > So I think the code needs to return 0 if _any_ fault was successful.
>
> s/any/the first/...
>
> The same goes for fault-in for read, of course; I've a half-baked conversion
> to such semantics (-EFAULT vs. 0; precise length is unreliable anyway,
> especially if you have sub-page failure areas), need to finish and post
> it...

Hmm, how could we have sub-page failure areas when this is about if
and how pages are mapped? If we return the number of bytes that are
accessible, then users will know if they got nothing, something, or
everything, and they can act accordingly.

Thanks,
Andreas

