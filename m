Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 698CD1647AB
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 16:01:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582124486;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GkoCyfJWEkKwE03qzjqTmOEaW4O33g2S9ZOduTABmMI=;
	b=NLmngmO95J28GFpYYk/U6AUHLp/0aBv1X2RemnkewlosYsnjxX0jgwO4v6tOx3FXNbbdqj
	D6LPD2FWznP9OcIcwcu3svnl6Vlk8N+0khm6yqpC7j7M80Ve1KUbLUoLAB9e9Nm9wn+Ljj
	S+IQNpkDeYk3GnTJDqa4Lki79gNcHYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-u5IwQgFyOdi_-tvmnPaa_g-1; Wed, 19 Feb 2020 10:01:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CF47800D4E;
	Wed, 19 Feb 2020 15:01:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F369B5C541;
	Wed, 19 Feb 2020 15:01:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A2D21808878;
	Wed, 19 Feb 2020 15:01:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JF1DcG012122 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 10:01:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 815432166B28; Wed, 19 Feb 2020 15:01:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC8C2166B27
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 15:01:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57B338028A4
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 15:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-ew5pl9LVMFOk1lm8jBTKOg-1; Wed, 19 Feb 2020 10:01:08 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4QqV-0003kJ-Mw; Wed, 19 Feb 2020 15:01:03 +0000
Date: Wed, 19 Feb 2020 07:01:03 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200219150103.GQ24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
	<20200219144117.GP24185@bombadil.infradead.org>
	<20200219145246.GA29869@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219145246.GA29869@infradead.org>
X-MC-Unique: ew5pl9LVMFOk1lm8jBTKOg-1
X-MC-Unique: u5IwQgFyOdi_-tvmnPaa_g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JF1DcG012122
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 07/19] mm: Put readahead pages in
	cache earlier
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 06:52:46AM -0800, Christoph Hellwig wrote:
> On Wed, Feb 19, 2020 at 06:41:17AM -0800, Matthew Wilcox wrote:
> > #define readahead_for_each(rac, page)                                  =
 \
> >         while ((page =3D readahead_page(rac)))
> >=20
> > No more readahead_next() to forget to add to filesystems which don't us=
e
> > the readahead_for_each() iterator.  Ahem.
>=20
> And then kill readahead_for_each and open code the above to make it
> even more obvious?

Makes sense.


