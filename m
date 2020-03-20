Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4558818D5D8
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 18:31:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584725461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=38KDz6/rlyQ+BZbAHs8mZOWqYigxOgGPUIMZolk2yOU=;
	b=d4AaXHMT2IBnherQ1FzQamF53kXrWv5xKEIfTzbUNdnL/NTgXZXOOVkCpt7k3lk1makIRa
	nY/OM22+BgI3g5EKczX3F6XOBhUAa2xbY5Uj6jMfbLW4MkOsqpS2/syv9mw0HiVtqmAvd6
	YrqpXOWJ1U5Vw5ulhQWDOvA7MgODGX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-oUDPiE0KOMaaJMU18VlOFQ-1; Fri, 20 Mar 2020 13:30:59 -0400
X-MC-Unique: oUDPiE0KOMaaJMU18VlOFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6627B18AB2D0;
	Fri, 20 Mar 2020 17:30:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 458969495C;
	Fri, 20 Mar 2020 17:30:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDD7F1809567;
	Fri, 20 Mar 2020 17:30:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KHUrYS029610 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 13:30:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D87482018036; Fri, 20 Mar 2020 17:30:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE6B1201EFBB
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 17:30:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E362101A55E
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 17:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-zbFW0ywKPRWXIDA8bvtAkA-1; Fri, 20 Mar 2020 13:30:48 -0400
X-MC-Unique: zbFW0ywKPRWXIDA8bvtAkA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFLTk-0003g5-Sd; Fri, 20 Mar 2020 17:30:40 +0000
Date: Fri, 20 Mar 2020 10:30:40 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200320173040.GB4971@bombadil.infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
	<20200320142231.2402-13-willy@infradead.org>
	<20200320165828.GB851@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200320165828.GB851@sol.localdomain>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KHUrYS029610
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v9 12/25] mm: Move end_index check out
	of readahead loop
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Mar 20, 2020 at 09:58:28AM -0700, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 07:22:18AM -0700, Matthew Wilcox wrote:
> > +=09/* Avoid wrapping to the beginning of the file */
> > +=09if (index + nr_to_read < index)
> > +=09=09nr_to_read =3D ULONG_MAX - index + 1;
> > +=09/* Don't read past the page containing the last byte of the file */
> > +=09if (index + nr_to_read >=3D end_index)
> > +=09=09nr_to_read =3D end_index - index + 1;
>=20
> There seem to be a couple off-by-one errors here.  Shouldn't it be:
>=20
> =09/* Avoid wrapping to the beginning of the file */
> =09if (index + nr_to_read < index)
> =09=09nr_to_read =3D ULONG_MAX - index;

I think it's right.  Imagine that index is ULONG_MAX.  We should read one
page (the one at ULONG_MAX).  That would be ULONG_MAX - ULONG_MAX + 1.

> =09/* Don't read past the page containing the last byte of the file */
> =09if (index + nr_to_read > end_index)
> =09=09nr_to_read =3D end_index - index + 1;
>=20
> I.e., 'ULONG_MAX - index' rather than 'ULONG_MAX - index + 1', so that
> 'index + nr_to_read' is then ULONG_MAX rather than overflowed to 0.
>=20
> Then 'index + nr_to_read > end_index' rather 'index + nr_to_read >=3D end=
_index',
> since otherwise nr_to_read can be increased by 1 rather than decreased or=
 stay
> the same as expected.

Ooh, I missed the overflow case here.  It should be:

+=09if (index + nr_to_read - 1 > end_index)
+=09=09nr_to_read =3D end_index - index + 1;

Let's say index comes in at ULONG_MAX - 2, end_index is ULONG_MAX - 1
and nr_to_read is 8.  The first condition triggers and nr_to_read is
reduced to 3.  But then the second condition wouldn't trigger because
ULONG_MAX - 2 + 3 is 0.

With the rewrite I have in this message, ULONG_MAX - 2 + 3 - 1 is ULONG_MAX=
,
which is > ULONG_MAX - 1.  So the condition triggers and nr_to_read becomes
(ULONG_MAX - 1) - (ULONG_MAX - 2) + 1.  Which is -1 + 2 + 1, which is 2.
Which is the right answer because we want to read two pages; the one
at ULONG_MAX - 2 and the one at ULONG_MAX - 1.

Thank you!


