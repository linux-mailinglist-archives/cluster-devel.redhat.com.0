Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08366B6F3
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 06:46:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673847964;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DyqbCFVVSRH9BdL+CtsL2Q0IUbjE2/UgdwZHHo8qQB0=;
	b=fzTmW04RquolcG+8JFk17zEqyUWZmZyed7ur8Edz8QrRp9mr6V7a/93rdtYnE1CNJ2NYQE
	tBTXM1FWbv72RHGElRPuPriuPEE55TMaVdJk3lKyK4uOMtQ9HASjZQ1hr/2uuKUsv/tqno
	rqaT9I1319VF+JLWT/3NwYrPeLJpdw8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-NMnVbCbrOPSOcerGdJZHhg-1; Mon, 16 Jan 2023 00:45:58 -0500
X-MC-Unique: NMnVbCbrOPSOcerGdJZHhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6BC780D0F5;
	Mon, 16 Jan 2023 05:45:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C00BBC15BA0;
	Mon, 16 Jan 2023 05:45:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CCFE1947067;
	Mon, 16 Jan 2023 05:45:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 87AA119465B1 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 05:45:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A43B2166B29; Mon, 16 Jan 2023 05:45:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 638892166B26
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 05:45:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D5A218483B4
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 05:45:55 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-135-v2bNbTCBNPmdzEMfEBrhzQ-1; Mon,
 16 Jan 2023 00:45:53 -0500
X-MC-Unique: v2bNbTCBNPmdzEMfEBrhzQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pHIJl-008SpC-8k; Mon, 16 Jan 2023 05:46:01 +0000
Date: Mon, 16 Jan 2023 05:46:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <Y8TkmbZfe3L/Yeky@casper.infradead.org>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org> <Y8QxYjy+4Kjg05rB@magnolia>
 <Y8QyqlAkLyysv8Qd@magnolia>
MIME-Version: 1.0
In-Reply-To: <Y8QyqlAkLyysv8Qd@magnolia>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 15, 2023 at 09:06:50AM -0800, Darrick J. Wong wrote:
> On Sun, Jan 15, 2023 at 09:01:22AM -0800, Darrick J. Wong wrote:
> > On Tue, Jan 10, 2023 at 01:34:16PM +0000, Matthew Wilcox wrote:
> > > On Tue, Jan 10, 2023 at 12:46:45AM -0800, Christoph Hellwig wrote:
> > > > On Mon, Jan 09, 2023 at 01:46:42PM +0100, Andreas Gruenbacher wrote:
> > > > > We can handle that by adding a new IOMAP_NOCREATE iterator flag and
> > > > > checking for that in iomap_get_folio().  Your patch then turns into
> > > > > the below.
> > > > 
> > > > Exactly.  And as I already pointed out in reply to Dave's original
> > > > patch what we really should be doing is returning an ERR_PTR from
> > > > __filemap_get_folio instead of reverse-engineering the expected
> > > > error code.
> > > 
> > > Ouch, we have a nasty problem.
> > > 
> > > If somebody passes FGP_ENTRY, we can return a shadow entry.  And the
> > > encodings for shadow entries overlap with the encodings for ERR_PTR,
> > > meaning that some shadow entries will look like errors.  The way I
> > > solved this in the XArray code is by shifting the error values by
> > > two bits and encoding errors as XA_ERROR(-ENOMEM) (for example).
> > > 
> > > I don't _object_ to introducing XA_ERROR() / xa_err() into the VFS,
> > > but so far we haven't, and I'd like to make that decision intentionally.
> > 
> > Sorry, I'm not following this at all -- where in buffered-io.c does
> > anyone pass FGP_ENTRY?  Andreas' code doesn't seem to introduce it
> > either...?
> 
> Oh, never mind, I worked out that the conflict is between iomap not
> passing FGP_ENTRY and wanting a pointer or a negative errno; and someone
> who does FGP_ENTRY, in which case the xarray value can be confused for a
> negative errno.
> 
> OFC now I wonder, can we simply say that the return value is "The found
> folio or NULL if you set FGP_ENTRY; or the found folio or a negative
> errno if you don't" ?

Erm ... I would rather not!

Part of me remembers that x86-64 has the rather nice calling convention
of being able to return a struct containing two values in two registers:

: Integer return values up to 64 bits in size are stored in RAX while
: values up to 128 bit are stored in RAX and RDX.

so maybe we can return:

struct OptionFolio {
	int err;
	struct folio *folio;
};

