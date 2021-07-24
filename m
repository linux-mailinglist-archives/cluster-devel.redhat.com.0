Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CBB783D49EA
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 22:38:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-_5sAKwuaM6O-whmi0OYA9g-1; Sat, 24 Jul 2021 16:38:39 -0400
X-MC-Unique: _5sAKwuaM6O-whmi0OYA9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A91801A92;
	Sat, 24 Jul 2021 20:38:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C19B319D7C;
	Sat, 24 Jul 2021 20:38:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BC2D180BAB2;
	Sat, 24 Jul 2021 20:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OKbYe1023199 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 16:37:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2BC3E9C068; Sat, 24 Jul 2021 20:37:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 269AA9C069
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 20:37:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40C86801005
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 20:37:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-Ugh7uUl0OvezTWWOn56XWw-1; Sat, 24 Jul 2021 16:37:28 -0400
X-MC-Unique: Ugh7uUl0OvezTWWOn56XWw-1
Received: by mail-lf1-f48.google.com with SMTP id m13so8079711lfg.13
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 13:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ho2aOvJzVUGxbigA5Ok8jwjbjidvHRLuevL3w0ehES8=;
	b=NsI+4V9L7ot0saR6H/2vV3+wr6Q4NKJvUDqtqBcUTVVOZ4OP6TJQbqq1teccUYOtvi
	eXjRhJl6gxIampniOVUhLOEhlEQS05H7vwJ6UUGwsh6MBWhMlTKNeB7lKmRf0OWKnXEc
	uBJM/sjaUcrPCs2g9hB/OI23qqst+oYcW32aJPm0yvWVnX2DKubXYYU/W0OXnb3kUMcv
	WOl7P4JC4hx2CXPW/5b+0d6ERFScO/zydbJWWktxcGoh2Ie8siyq/gGmTvm+XfPSeMXi
	nByTAcPu2eOH/kCPoJIjcYLWvsHtunV/J99vAI0SeX8DNQWm6wExo8WPsJYpCmsUqkgk
	Snnw==
X-Gm-Message-State: AOAM533q8fqEFJQSTDD3LdBaqtoX+Cn8J3XiO5hNB5c95H0O3/LHetxQ
	JeQRDDujnRgD3To90dlzNpKosJXegi+knaAZ
X-Google-Smtp-Source: ABdhPJxXXpOJhJeFsORX1uOxQWX60RIRzVlLq+lVUDlfh8v3IM03/RDIF594wbrhQOR5SoGUsgoArQ==
X-Received: by 2002:ac2:5e3c:: with SMTP id o28mr7708988lfg.592.1627159046959; 
	Sat, 24 Jul 2021 13:37:26 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
	[209.85.167.41]) by smtp.gmail.com with ESMTPSA id
	k21sm3640887lji.107.2021.07.24.13.37.26
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 24 Jul 2021 13:37:26 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id d17so8228493lfv.0
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 13:37:26 -0700 (PDT)
X-Received: by 2002:ac2:44ad:: with SMTP id c13mr7135571lfm.377.1627159045780; 
	Sat, 24 Jul 2021 13:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
In-Reply-To: <YPx28cEvrVl6YrDk@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Jul 2021 13:37:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1d2ELuN-Qtf59dsJ4OG-YRqAk2YrLS3=PRMTc2trZvA@mail.gmail.com>
Message-ID: <CAHk-=wj1d2ELuN-Qtf59dsJ4OG-YRqAk2YrLS3=PRMTc2trZvA@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
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

On Sat, Jul 24, 2021 at 1:26 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sat, Jul 24, 2021 at 12:52:34PM -0700, Linus Torvalds wrote:
>
> > So I think the code needs to return 0 if _any_ fault was successful.
>
> s/any/the first/...

Yes, but as long as we do them in order, and stop when it fails, "any"
and "first" end up being the same thing ;)

> The same goes for fault-in for read

Yeah. That said, a partial write() (ie "read from user space") might
be something that a filesystem is not willing to touch for other
reasons, so I think returning -EFAULT in that case is, I think,
slightly more reasonable.

Things like "I have to prepare buffers to be filled" etc.

The partial read() case is at least something that a filesystem should
be able to handle fairly easily.

And I don't think returning -EFAULT early is necessarily wrong - we
obviously do it anyway if you give really invalid addresses.

But we have generally strived to allow partial IO for missing pages,
because people sometimes play games with unmapping things dynamically
or using mprotect() to catch modifications (ie doing things like catch
SIGSEGV/SIGBUS, and remap it).

But those kinds of uses tend to have to catch -EFAULT anyway, so I
guess it's not a big deal either way.

           Linus

