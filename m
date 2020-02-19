Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E17D164B2D
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 17:56:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582131360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m+cS8V92HiQRjGX97z8VNc+5ofex/JH3Gc3MGjsT8qw=;
	b=dr1j98AMwEDMx7FgyQyflaQCy6HiaalZSDiSD1VXW2GAK67ME5VeUkmhp5o/af67mRLTuY
	h36/oen32ugggnf+ge/SkWVFDohhIPiPE8JoP/UaApM3v++HWp8hbBmcX80dlcfO4raI+z
	CnBGyYgFeMuBcFpD2OdHmxtY12XZ7J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-ca3VrSIVP6ezHIEVtwC56Q-1; Wed, 19 Feb 2020 11:55:58 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A11813E6;
	Wed, 19 Feb 2020 16:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1473D5C1B0;
	Wed, 19 Feb 2020 16:55:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C05D935B0D;
	Wed, 19 Feb 2020 16:55:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JGqqhI018235 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 11:52:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 356E72166B28; Wed, 19 Feb 2020 16:52:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 316AA2166B27
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 16:52:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE45B1024D03
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 16:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-128-y82skW4MM1CvOVYEGTKLuw-1; Wed, 19 Feb 2020 11:52:44 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4SaX-0004DT-TU; Wed, 19 Feb 2020 16:52:41 +0000
Date: Wed, 19 Feb 2020 08:52:41 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200219165241.GR24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-14-willy@infradead.org>
	<20200219031044.GA1075@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200219031044.GA1075@sol.localdomain>
X-MC-Unique: y82skW4MM1CvOVYEGTKLuw-1
X-MC-Unique: ca3VrSIVP6ezHIEVtwC56Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JGqqhI018235
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 08/19] mm: Add readahead address
	space operation
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

On Tue, Feb 18, 2020 at 07:10:44PM -0800, Eric Biggers wrote:
> > +``readahead``
> > +=09Called by the VM to read pages associated with the address_space
> > +=09object.  The pages are consecutive in the page cache and are
> > +=09locked.  The implementation should decrement the page refcount
> > +=09after starting I/O on each page.  Usually the page will be
> > +=09unlocked by the I/O completion handler.  If the function does
> > +=09not attempt I/O on some pages, the caller will decrement the page
> > +=09refcount and unlock the pages for you.=09Set PageUptodate if the
> > +=09I/O completes successfully.  Setting PageError on any page will
> > +=09be ignored; simply unlock the page if an I/O error occurs.
> > +
>=20
> This is unclear about how "not attempting I/O" works and how that affects=
 who is
> responsible for putting and unlocking the pages.  How does the caller kno=
w which
> pages were not attempted?  Can any arbitrary subset of pages be not attem=
pted,
> or just the last N pages?

Changed to:

``readahead``
        Called by the VM to read pages associated with the address_space
        object.  The pages are consecutive in the page cache and are
        locked.  The implementation should decrement the page refcount
        after starting I/O on each page.  Usually the page will be
        unlocked by the I/O completion handler.  If the filesystem decides
        to stop attempting I/O before reaching the end of the readahead
        window, it can simply return.  The caller will decrement the page
        refcount and unlock the remaining pages for you.  Set PageUptodate
        if the I/O completes successfully.  Setting PageError on any page
        will be ignored; simply unlock the page if an I/O error occurs.


