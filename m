Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5C67241E
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674060666;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6tNDSNkFiJEqqIZ//J/1DmHsVFKzcFqD4Ly/ZSfJnDY=;
	b=ivUwpBTmcckFnCzelLwy0/E7yrL/aC1MTBV+t2KJUnzk1IXA/7JY6FTh4iI1gq41l65X6G
	Eaw3/69HssBkcMINYlCFTFJjRU6hOvcKbzYL7xQCixLpO3dhTtpBhViDdjH/jKpUqNtdi0
	f3Qg04rgkSeYe2z28Mf49THkouq4iyM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-olxFtaKbOYevSAlPLIYezg-1; Wed, 18 Jan 2023 11:51:00 -0500
X-MC-Unique: olxFtaKbOYevSAlPLIYezg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9926A101A55E;
	Wed, 18 Jan 2023 16:50:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D2471121315;
	Wed, 18 Jan 2023 16:50:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6507E1946A6E;
	Wed, 18 Jan 2023 16:50:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B55821946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:50:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A618F1415108; Wed, 18 Jan 2023 16:50:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DD2D1400E44
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:50:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5977A85A588
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:50:57 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-4rwArKrgOW2NOTSpFAKjtA-1; Wed, 18 Jan 2023 11:50:54 -0500
X-MC-Unique: 4rwArKrgOW2NOTSpFAKjtA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7BA7A67373; Wed, 18 Jan 2023 17:42:08 +0100 (CET)
Date: Wed, 18 Jan 2023 17:42:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Message-ID: <20230118164208.GA7584@lst.de>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-10-hch@lst.de>
 <CAKFNMomcjvUSh-nS1MqptYdiT-1frRsmHgx2mHBBm_588kprrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKFNMomcjvUSh-nS1MqptYdiT-1frRsmHgx2mHBBm_588kprrQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 9/9] mm: return an ERR_PTR from
 __filemap_get_folio
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
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 09:39:08PM +0900, Ryusuke Konishi wrote:
> > Also pass through the error through the direct callers:
> 
> > filemap_get_folio, filemap_lock_folio filemap_grab_folio
> > and filemap_get_incore_folio.
> 
> As for the comments describing the return values of these callers,
> isn't it necessary to rewrite the value from NULL in case of errors ?

Yes, thanks for catching this.

