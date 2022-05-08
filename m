Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4B51F025
	for <lists+cluster-devel@lfdr.de>; Sun,  8 May 2022 21:28:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61--bH_vevUPJytJ3TtSwSILw-1; Sun, 08 May 2022 15:28:10 -0400
X-MC-Unique: -bH_vevUPJytJ3TtSwSILw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72E071C0512B;
	Sun,  8 May 2022 19:28:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1AD8C28105;
	Sun,  8 May 2022 19:28:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 621051947055;
	Sun,  8 May 2022 19:28:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 707441947041 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 May 2022 19:28:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4073E438BF7; Sun,  8 May 2022 19:28:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C943438BF6
 for <cluster-devel@redhat.com>; Sun,  8 May 2022 19:28:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254DA29AA3B5
 for <cluster-devel@redhat.com>; Sun,  8 May 2022 19:28:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-bflyUe9QPOOfPclS2WCUMQ-1; Sun, 08 May 2022 15:28:04 -0400
X-MC-Unique: bflyUe9QPOOfPclS2WCUMQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nnmEn-002k8z-4S; Sun, 08 May 2022 19:06:37 +0000
Date: Sun, 8 May 2022 20:06:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YngUvbIyPA2gsslF@casper.infradead.org>
References: <20220502054159.3471078-1-willy@infradead.org>
 <20220502054159.3471078-4-willy@infradead.org>
 <YnE60WTzSzxt9OxY@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YnE60WTzSzxt9OxY@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 3/3] fs: Change the type of filler_t
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
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 07:23:13AM -0700, Christoph Hellwig wrote:
> > @@ -3504,9 +3504,9 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
> >  
> >  filler:
> >  		if (filler)
> > -			err = filler(data, &folio->page);
> > +			err = filler(file, folio);
> >  		else
> > -			err = mapping->a_ops->read_folio(data, folio);
> > +			err = mapping->a_ops->read_folio(file, folio);
> 
> Wouldn't it just make sense to just pass mapping->a_ops->read_folio as
> the filler here from the callers that currently pass NULL?

Thanks for the review.  We're heading in the same direction; my
plan was to (in some subsequent merge window) convert all callers of
read_cache_page() to use read_mapping_folio() (by setting ->read_folio)
and then get rid of filler_t altogether.

Maybe there are some filesystems that can't do that, eg they need a
different ->read_folio() when called from read_cache_folio() to the
one they need when called for filemap_read(), but I bet they can all be
worked around.

