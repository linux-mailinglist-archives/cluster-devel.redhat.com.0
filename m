Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C32B6723D5
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:44:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674060255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XTcn6EOmvdcaySj22rnAGZTgHq4wvd/ke03TGVcbMbc=;
	b=gdfPCBartTJEeg5YwLvOiUAngPpGksJXShhgWYNN8hleWbaKZuLQpgHHCYTHtZlY/Gt5eV
	Nf2Jn4P3a4Ar5jXJjfnjyAKrUYtu5uI2VM/JAZPFI00GpcL+JH+ZjxjimMnqN1iUB1dPk2
	aMemM8rmUaAll4D+iKFoOOcmyXTUtPk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-pbCctqbQNYe9TDuK4Bxb6A-1; Wed, 18 Jan 2023 11:44:11 -0500
X-MC-Unique: pbCctqbQNYe9TDuK4Bxb6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3471C1C0759C;
	Wed, 18 Jan 2023 16:44:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C939C140EBF6;
	Wed, 18 Jan 2023 16:44:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B109C1946A73;
	Wed, 18 Jan 2023 16:44:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6890B1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:44:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 499EF2166B29; Wed, 18 Jan 2023 16:44:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 429D02166B26
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:44:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2564629AA38E
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:44:07 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-6xYJMw8YPPG3c3UvCmvRFA-1; Wed, 18 Jan 2023 11:44:02 -0500
X-MC-Unique: 6xYJMw8YPPG3c3UvCmvRFA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6550568D17; Wed, 18 Jan 2023 17:43:59 +0100 (CET)
Date: Wed, 18 Jan 2023 17:43:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Brian Foster <bfoster@redhat.com>
Message-ID: <20230118164358.GD7584@lst.de>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-5-hch@lst.de> <Y8f6sShghKuFim5E@bfoster>
MIME-Version: 1.0
In-Reply-To: <Y8f6sShghKuFim5E@bfoster>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 4/9] shmem: remove
 shmem_get_partial_folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 08:57:05AM -0500, Brian Foster wrote:
> This all seems reasonable to me at a glance, FWIW, but I am a little
> curious why this wouldn't split up into two changes. I.e., switch this
> over to filemap_get_entry() to minimally remove the FGP_ENTRY dependency
> without a behavior change, then (perhaps after the next patch) introduce
> SGP_FIND in a separate patch. That makes it easier to review and
> potentially undo if it happens to pose a problem in the future. Hm?

The minimal change to filemap_get_entry would require to add the
lock, check mapping and retry loop and thus add a fair amount of
code.  So I looked for ways to avoid that and came up with this
version.  But if there is a strong preference to first open code
the logic and then later consolidate it I could do that.

