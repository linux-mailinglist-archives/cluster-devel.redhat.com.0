Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 964F5163CBA
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 06:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582090565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lqHhFIk7k99k4kn2nAH7c0iCFHKrqvwTPU7jjjHspmU=;
	b=TNPCV+1GYtezYWiGJE/f5AVgm9CYXmkBnPDyq16sbhNSDtrYMHgPPJiiarHHMu7jfh5Juy
	iToOwAQPTMzpNgC4vAJS/h5cqBJ4wbUia2w3xjwOIHVXcvmwXOaknPpeXqJh5Bhag1E07j
	O1Cjgl5xtKLapt4e8ydLE2pBcHZBC6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-L7_dOg6HNnqe1zr65mpMIg-1; Wed, 19 Feb 2020 00:36:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C2C4DB63;
	Wed, 19 Feb 2020 05:36:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C1395C13C;
	Wed, 19 Feb 2020 05:36:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E71035B13;
	Wed, 19 Feb 2020 05:35:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J5ZuBC012802 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 00:35:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F6EC2026D67; Wed, 19 Feb 2020 05:35:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 296ED2063206
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 05:35:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97D388028A8
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 05:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-345-wJ24GLRbPv6rG_2C4snRvg-1; Wed, 19 Feb 2020 00:35:51 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4I1Q-0004Jt-TF; Wed, 19 Feb 2020 05:35:44 +0000
Date: Tue, 18 Feb 2020 21:35:44 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200219053544.GN24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-31-willy@infradead.org>
	<d4803ef9-7a2f-965f-8f0f-c5e15396d892@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d4803ef9-7a2f-965f-8f0f-c5e15396d892@nvidia.com>
X-MC-Unique: wJ24GLRbPv6rG_2C4snRvg-1
X-MC-Unique: L7_dOg6HNnqe1zr65mpMIg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J5ZuBC012802
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 17/19] iomap: Restructure
	iomap_readpages_actor
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

On Tue, Feb 18, 2020 at 07:17:18PM -0800, John Hubbard wrote:
> > -=09for (done =3D 0; done < length; done +=3D ret) {
>=20
> nit: this "for" loop was perfect just the way it was. :) I'd vote here fo=
r reverting
> the change to a "while" loop. Because with this change, now the code has =
to=20
> separately initialize "done", separately increment "done", and the beauty=
 of a
> for loop is that the loop init and control is all clearly in one place. F=
or things
> that follow that model (as in this case!), that's a Good Thing.
>=20
> And I don't see any technical reason (even in the following patch) that r=
equires=20
> this change.

It's doing the increment in the wrong place.  We want the increment done in
the middle of the loop, before we check whether we've got to the end of
the page.  Not at the end of the loop.

> > +=09BUG_ON(ctx.cur_page);
>=20
> Is a full BUG_ON() definitely called for here? Seems like a WARN might su=
ffice...

Dave made a similar comment; I'll pick this up there.


