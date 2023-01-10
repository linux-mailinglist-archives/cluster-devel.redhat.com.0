Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DF6641F9
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 14:34:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673357656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iaT9LQ1txjWmxV1XSqA3EJtlgw8CwLxTrjASqWSS7ew=;
	b=I8eYFKfNiuRlrosMAQSZrlJSiDglQY7hxR5+c1FyXursbxTVYCrCWl1mRkLwAk+IGmjlXr
	PHivcvAaW3OArFBrYW6OzttKmMhO6kJXZfY0rmSLk1cPmIhm6t5kF9uyETNET09XZ4zc10
	GkGI6jgjol7iV+rbyPvaxboERPLHMNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-h3juMkD8NG2z86KJ0yELMQ-1; Tue, 10 Jan 2023 08:34:13 -0500
X-MC-Unique: h3juMkD8NG2z86KJ0yELMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53FA92805586;
	Tue, 10 Jan 2023 13:34:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 001442026D2A;
	Tue, 10 Jan 2023 13:34:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 99AB8194E104;
	Tue, 10 Jan 2023 13:34:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E7D73194E107 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 13:34:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D5D40492C3C; Tue, 10 Jan 2023 13:34:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD1BB492C14
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 13:34:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1EE438173C4
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 13:34:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-468-5FMPvUNTPaqDTwqqrCD3BQ-1; Tue,
 10 Jan 2023 08:34:06 -0500
X-MC-Unique: 5FMPvUNTPaqDTwqqrCD3BQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFElc-003FE0-AE; Tue, 10 Jan 2023 13:34:16 +0000
Date: Tue, 10 Jan 2023 13:34:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y70l9ZZXpERjPqFT@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 linux-xfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 12:46:45AM -0800, Christoph Hellwig wrote:
> On Mon, Jan 09, 2023 at 01:46:42PM +0100, Andreas Gruenbacher wrote:
> > We can handle that by adding a new IOMAP_NOCREATE iterator flag and
> > checking for that in iomap_get_folio().  Your patch then turns into
> > the below.
> 
> Exactly.  And as I already pointed out in reply to Dave's original
> patch what we really should be doing is returning an ERR_PTR from
> __filemap_get_folio instead of reverse-engineering the expected
> error code.

Ouch, we have a nasty problem.

If somebody passes FGP_ENTRY, we can return a shadow entry.  And the
encodings for shadow entries overlap with the encodings for ERR_PTR,
meaning that some shadow entries will look like errors.  The way I
solved this in the XArray code is by shifting the error values by
two bits and encoding errors as XA_ERROR(-ENOMEM) (for example).

I don't _object_ to introducing XA_ERROR() / xa_err() into the VFS,
but so far we haven't, and I'd like to make that decision intentionally.

