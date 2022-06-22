Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED33554D13
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-3O2jqNd4PyCQI91R7UqExg-1; Wed, 22 Jun 2022 10:32:18 -0400
X-MC-Unique: 3O2jqNd4PyCQI91R7UqExg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC962802D1C;
	Wed, 22 Jun 2022 14:32:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9BD40F9D40;
	Wed, 22 Jun 2022 14:32:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4184E1947056;
	Wed, 22 Jun 2022 14:32:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 275181947051 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 14:30:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 15FEBC28115; Wed, 22 Jun 2022 14:30:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B80C26E98
 for <cluster-devel@redhat.com>; Wed, 22 Jun 2022 14:30:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F15651C0CE66
 for <cluster-devel@redhat.com>; Wed, 22 Jun 2022 14:30:15 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-JSy-sBWHNJqkErZZmtW7lg-1; Wed, 22 Jun 2022 10:30:12 -0400
X-MC-Unique: JSy-sBWHNJqkErZZmtW7lg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0A30368AA6; Wed, 22 Jun 2022 16:30:08 +0200 (CEST)
Date: Wed, 22 Jun 2022 16:30:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Price <anprice@redhat.com>
Message-ID: <20220622143007.GA31207@lst.de>
References: <20220621091420.GC3256@lst.de>
 <97a9a768-1915-f532-09a4-99ee78a639ae@redhat.com>
 <20220621125857.GA6999@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220621125857.GA6999@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] Mounting lock_nolock file systems?
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
Cc: cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
 willy@infradead.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 21, 2022 at 02:58:57PM +0200, Christoph Hellwig wrote:
> Sorry, actually it was the pagecache for-next branch from willy.  Looks
> like mainline itself is fine.
> 
> I'll try to get the superblock information from the pagecache branch
> once I find a little time, chasing a bunch of other bugs in the meantime.

I bisected it down to:

commit 1abe0e8c19c514827408ba7e7e84969b6f2e784f
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Wed May 18 14:41:39 2022 -0400

    gfs: Check PageUptodate instead of PageError
        
    This is the correct flag to test to know if the read completed
    successfully.
		    
    Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

but I don't have any explanation how it caused that breakage yet.

