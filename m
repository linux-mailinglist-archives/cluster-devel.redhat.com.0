Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F516766B7
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Jan 2023 15:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674311379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FWDoAs847ROsrYH1Am+1KPT/qny2B1bfiZIgvdohqwU=;
	b=M7QUcr12WAZQBmnb8y0xPpEB7OrXbHkln/jw5N96hroGikydAgE0ihY/vLCgi38ECbkqe9
	ySyzfKObMRCS+sGnZ/UYat8h+DG0lzwVlcFaLeQxpq/EztGz3x8zVMmfhcj1iZn6Z5DZuP
	2IHYMsHiLtI0D0/RGUtnqHCWYVlqJC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-ipOecAR4Oyyi8zz6RCXvFQ-1; Sat, 21 Jan 2023 09:29:36 -0500
X-MC-Unique: ipOecAR4Oyyi8zz6RCXvFQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 417AF85A588;
	Sat, 21 Jan 2023 14:29:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36169492B02;
	Sat, 21 Jan 2023 14:29:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F29071946594;
	Sat, 21 Jan 2023 14:29:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2AC31946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 21 Jan 2023 14:29:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 972D52166B2B; Sat, 21 Jan 2023 14:29:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9095F2166B2A
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 14:29:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7732785A588
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 14:29:33 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-YwLOIQYiN1m7fdIRCRuc3Q-1; Sat, 21 Jan 2023 09:29:31 -0500
X-MC-Unique: YwLOIQYiN1m7fdIRCRuc3Q-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3598568CFE; Sat, 21 Jan 2023 15:29:28 +0100 (CET)
Date: Sat, 21 Jan 2023 15:29:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20230121142927.GB6786@lst.de>
References: <20230120141150.1278819-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230120141150.1278819-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH] Revert "gfs2: stop using
 generic_writepages in gfs2_ail1_start_one"
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
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +	struct address_space *mapping = data;
> +	int ret = mapping->a_ops->writepage(page, wbc);
> +	mapping_set_error(mapping, ret);
> +	return ret;

I guess beggars can't be choosers, but is there a chance to directly
call the relevant gfs2 writepage methods here instead of the
->writepage call?

Otherwise this looks good:

Acked-by: Christoph Hellwig <hch@lst.de>

