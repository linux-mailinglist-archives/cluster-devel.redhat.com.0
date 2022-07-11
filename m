Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712F570596
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 16:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657549832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yw8ieoFmSzrk2yg4LmG8l6csK3EDPE9tp4+Y4E7I/h8=;
	b=PLZPSa7i2zp/1U0sYp2qxWjjTvi5Q/D0a18txTdZhV7D/FSQq5k8nubRYO4psFsQxM6KiM
	bpS6j80Z//du0LapqRaDa8pjlKZs7+zfRdk2b9dBh6sLTHCOSXYqDjmTNBZ/Nq07f4GlWA
	H+hnEQ1JWZoTAGvnCs0nX1hWqCgapQM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-4Xfbu5q3PdyPtV_ASCRS3w-1; Mon, 11 Jul 2022 10:30:29 -0400
X-MC-Unique: 4Xfbu5q3PdyPtV_ASCRS3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16600804184;
	Mon, 11 Jul 2022 14:30:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A859C15D40;
	Mon, 11 Jul 2022 14:30:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9EC0E1947057;
	Mon, 11 Jul 2022 14:30:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0E1B1947055 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 14:30:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9011A492C3B; Mon, 11 Jul 2022 14:30:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C1BE401E54
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 14:30:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7793C811E90
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 14:30:24 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441--N6KN746OD63N6nYFylkuA-1; Mon, 11 Jul 2022 10:30:20 -0400
X-MC-Unique: -N6KN746OD63N6nYFylkuA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3E4C268AA6; Mon, 11 Jul 2022 16:30:16 +0200 (CEST)
Date: Mon, 11 Jul 2022 16:30:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20220711143015.GA22291@lst.de>
References: <20220711041459.1062583-2-hch@lst.de>
 <20220711102747.359525-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220711102747.359525-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 1/4] gfs2: stop using generic_writepages
 in gfs2_ail1_start_one
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2022 at 12:27:47PM +0200, Andreas Gruenbacher wrote:
> Can you add the below follow-up cleanup?

> -		gfs2_lm(sdp, "gfs2_ail1_start_one (generic_writepages) "
> -			"returned: %d\n", ret);
> +		gfs2_lm(sdp, "gfs2_ail1_start_one returned %d\n", ret);

The cleanup looks fine to me, yes.

