Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592767241C
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674060660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FsdtOAivn7H/W1rHOHf4orscZrNspuC1yh//ShcpMIY=;
	b=PLzUzyzjmD/uO3gTSJAqU+M4RTxIIUTFVlsfOvz3GQtr9J6x9TElWwru5GJX0pYIdUlF9l
	ipGz9aDDWS4kHjQ7UM2DmZCjH06pbo6swfxbrDus2NFL2ApOaoi1OFDeW1MnJOH/vbTB/8
	A8RHKriLbE5hJ82YvQ6hm8Ug0p9EQR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-PlY3tba8NpytsfmZJnMK0g-1; Wed, 18 Jan 2023 11:50:57 -0500
X-MC-Unique: PlY3tba8NpytsfmZJnMK0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBF95101A52E;
	Wed, 18 Jan 2023 16:50:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B133540C2064;
	Wed, 18 Jan 2023 16:50:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53C6B1946A72;
	Wed, 18 Jan 2023 16:50:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE3511946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:50:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E304451E5; Wed, 18 Jan 2023 16:50:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB71353A0
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:50:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C091C857A85
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:50:54 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-dl-hNCJ9NJq2HurEMN6mig-1; Wed, 18 Jan 2023 11:50:53 -0500
X-MC-Unique: dl-hNCJ9NJq2HurEMN6mig-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E41468D13; Wed, 18 Jan 2023 17:42:48 +0100 (CET)
Date: Wed, 18 Jan 2023 17:42:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230118164247.GC7584@lst.de>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-9-hch@lst.de> <Y8gZmTFB6vCivxsY@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y8gZmTFB6vCivxsY@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 8/9] btrfs: handle a NULL folio in
 extent_range_redirty_for_io
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 04:08:57PM +0000, Matthew Wilcox wrote:
> On Wed, Jan 18, 2023 at 10:43:28AM +0100, Christoph Hellwig wrote:
> > filemap_get_folio can return NULL, skip those cases.
> 
> Hmm, I'm not sure that's true.  We have one place that calls
> extent_range_redirty_for_io(), and it previously calls
> extent_range_clear_dirty_for_io() which has an explicit
> 
>                 BUG_ON(!page); /* Pages should be in the extent_io_tree */
> 
> so I'm going to say this one can't happen either.  I haven't delved far
> enough into btrfs to figure out why it can't happen.

I'll drop this patch for now.

