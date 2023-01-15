Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A466B2B5
	for <lists+cluster-devel@lfdr.de>; Sun, 15 Jan 2023 18:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673802098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=czHGi1Zj8nkmAtKYdQB9eQpgmZ0g6JJV9tAV0oauCTE=;
	b=I4AFuuj+w46cwumIApDGPwGBAlmB2Fs3YKRfMORZG5s9xCRLfe3WEXffFbFeKIR/zDPb52
	WTXe2VptvukSyvZguQKhOBung85+joVJDN+Fuli6vjXvQuUK099e9GODH5fbHH+PROiL6n
	m3ionbZn1/fqVsZyzaM8t8CXRc7x0v4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-_T2yKyfyPSaiHv9Al6YDYg-1; Sun, 15 Jan 2023 12:01:33 -0500
X-MC-Unique: _T2yKyfyPSaiHv9Al6YDYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79AD1C068E2;
	Sun, 15 Jan 2023 17:01:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 085171121314;
	Sun, 15 Jan 2023 17:01:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65F7F1946A6C;
	Sun, 15 Jan 2023 17:01:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 785931946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 15 Jan 2023 17:01:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0341940C2004; Sun, 15 Jan 2023 17:01:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5C640C2064
 for <cluster-devel@redhat.com>; Sun, 15 Jan 2023 17:01:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4E8D101A521
 for <cluster-devel@redhat.com>; Sun, 15 Jan 2023 17:01:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-nyyij6eENlWo2In20zrThw-1; Sun, 15 Jan 2023 12:01:25 -0500
X-MC-Unique: nyyij6eENlWo2In20zrThw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7C8B60D45;
 Sun, 15 Jan 2023 17:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B724C433F0;
 Sun, 15 Jan 2023 17:01:23 +0000 (UTC)
Date: Sun, 15 Jan 2023 09:01:22 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y8QxYjy+4Kjg05rB@magnolia>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 01:34:16PM +0000, Matthew Wilcox wrote:
> On Tue, Jan 10, 2023 at 12:46:45AM -0800, Christoph Hellwig wrote:
> > On Mon, Jan 09, 2023 at 01:46:42PM +0100, Andreas Gruenbacher wrote:
> > > We can handle that by adding a new IOMAP_NOCREATE iterator flag and
> > > checking for that in iomap_get_folio().  Your patch then turns into
> > > the below.
> > 
> > Exactly.  And as I already pointed out in reply to Dave's original
> > patch what we really should be doing is returning an ERR_PTR from
> > __filemap_get_folio instead of reverse-engineering the expected
> > error code.
> 
> Ouch, we have a nasty problem.
> 
> If somebody passes FGP_ENTRY, we can return a shadow entry.  And the
> encodings for shadow entries overlap with the encodings for ERR_PTR,
> meaning that some shadow entries will look like errors.  The way I
> solved this in the XArray code is by shifting the error values by
> two bits and encoding errors as XA_ERROR(-ENOMEM) (for example).
> 
> I don't _object_ to introducing XA_ERROR() / xa_err() into the VFS,
> but so far we haven't, and I'd like to make that decision intentionally.

Sorry, I'm not following this at all -- where in buffered-io.c does
anyone pass FGP_ENTRY?  Andreas' code doesn't seem to introduce it
either...?

--D

