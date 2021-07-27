Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7C23D7222
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 11:38:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-7INyl6QJPsG2-lkl9pBuXw-1; Tue, 27 Jul 2021 05:38:33 -0400
X-MC-Unique: 7INyl6QJPsG2-lkl9pBuXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A49101C8A8;
	Tue, 27 Jul 2021 09:38:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D349546;
	Tue, 27 Jul 2021 09:38:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC92A4A7C8;
	Tue, 27 Jul 2021 09:38:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16R9UD8V030696 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 05:30:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F09B20341DB; Tue, 27 Jul 2021 09:30:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A54F2037D7F
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 09:30:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48222858293
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 09:30:09 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [185.58.85.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-76-bgEl0VxYPgicI4YXpf7-QQ-1;
	Tue, 27 Jul 2021 05:30:06 -0400
X-MC-Unique: bgEl0VxYPgicI4YXpf7-QQ-1
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-70-ms7TCF98MzyTiP7ml5G1wg-1; Tue, 27 Jul 2021 10:30:03 +0100
X-MC-Unique: ms7TCF98MzyTiP7ml5G1wg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft
	SMTP Server (TLS) id 15.0.1497.23; Tue, 27 Jul 2021 10:30:02 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
	AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
	15.00.1497.023; Tue, 27 Jul 2021 10:30:02 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Linus Torvalds'" <torvalds@linux-foundation.org>, Andreas Gruenbacher
	<agruenba@redhat.com>
Thread-Topic: [PATCH v4 1/8] iov_iter: Introduce iov_iter_fault_in_writeable
	helper
Thread-Index: AQHXgMWAppW/hO87w0mGvb576BwgJqtWjhtg
Date: Tue, 27 Jul 2021 09:30:02 +0000
Message-ID: <03e0541400e946cf87bc285198b82491@AcuMS.aculab.com>
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
In-Reply-To: <CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16R9UD8V030696
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
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
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Linus Torvalds
> Sent: 24 July 2021 20:53
> 
> On Sat, Jul 24, 2021 at 12:35 PM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > +int iov_iter_fault_in_writeable(const struct iov_iter *i, size_t bytes)
> > +{
> ...
> > +                       if (fault_in_user_pages(start, len, true) != len)
> > +                               return -EFAULT;
> 
> Looking at this once more, I think this is likely wrong.
> 
> Why?
> 
> Because any user can/should only care about at least *part* of the
> area being writable.
> 
> Imagine that you're doing a large read. If the *first* page is
> writable, you should still return the partial read, not -EFAULT.

My 2c...

Is it actually worth doing any more than ensuring the first byte
of the buffer is paged in before entering the block that has
to disable page faults?

Most of the all the pages are present so the IO completes.

The pages can always get unmapped (due to page pressure or
another application thread unmapping them) so there needs
to be a retry loop.
Given the cost of actually faulting in a page going around
the outer loop may not matter.
Indeed, if an application has just mmap()ed in a very large
file and is then doing a write() from it then it is quite
likely that the pages got unmapped!

Clearly there needs to be extra code to ensure progress is made.
This might actually require the use of 'bounce buffers'
for really problematic user requests.

I also wonder what actually happens for pipes and fifos.
IIRC reads and write of up to PIPE_MAX (typically 4096)
are expected to be atomic.
This should be true even if there are page faults part way
through the copy_to/from_user().

It has to be said I can't see any reference to PIPE_MAX
in the linux man pages, but I'm sure it is in the POSIX/TOG
spec.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

