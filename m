Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CA2585156
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Jul 2022 16:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659103933;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5JvxEjjjwGvERweBKNt8uQ/MS7Ngeidl+zqfM8v4vhQ=;
	b=ahj4DxIK2iAlKRLnXnJA0llsuZzPqTjaUHrwGEjdEqTdcW7+1ihaK81lIyMIJAAioATVr6
	Frj3NdV3sv8nbDTe9nTQkHo07bE4WtPvfX4ge3N1DK47HZO0OM6L/X9GwvWvP1RjbiGGj2
	STaKFYbRPx9oPBeWlbdp9FLdxhQRSA0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-x0H1nPTFOjKskV9rz0OcUg-1; Fri, 29 Jul 2022 10:12:10 -0400
X-MC-Unique: x0H1nPTFOjKskV9rz0OcUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80ABC280D203;
	Fri, 29 Jul 2022 14:12:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11F401121314;
	Fri, 29 Jul 2022 14:12:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7FF51932126;
	Fri, 29 Jul 2022 14:11:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2F2D1932121 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 29 Jul 2022 14:11:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC63D40CFD0A; Fri, 29 Jul 2022 14:11:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8ED640CF8E8
 for <cluster-devel@redhat.com>; Fri, 29 Jul 2022 14:11:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4CE085A584
 for <cluster-devel@redhat.com>; Fri, 29 Jul 2022 14:11:54 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-JFGGHac-NVCcHmVXkj8IVg-1; Fri, 29 Jul 2022 10:11:50 -0400
X-MC-Unique: JFGGHac-NVCcHmVXkj8IVg-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 15D2868AA6; Fri, 29 Jul 2022 16:11:46 +0200 (CEST)
Date: Fri, 29 Jul 2022 16:11:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mel Gorman <mgorman@suse.de>
Message-ID: <20220729141145.GA31605@lst.de>
References: <20220719041311.709250-1-hch@lst.de>
 <20220728111016.uwbaywprzkzne7ib@quack3> <20220729092216.GE3493@suse.de>
MIME-Version: 1.0
In-Reply-To: <20220729092216.GE3493@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] remove iomap_writepage v2
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
 Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2022 at 10:22:16AM +0100, Mel Gorman wrote:
> There is some context missing because it's not clear what the full impact is
> but it is definitly the case that writepage is ignored in some contexts for
> common filesystems so lets assume that writepage from reclaim context always
> failed as a worst case scenario. Certainly this type of change is something
> linux-mm needs to be aware of because we've been blind-sided before.

Between willy and Johannes pushing or it I was under the strong assumption
that linux-mm knows of it..

> I don't think it would be incredibly damaging although there *might* be
> issues with small systems or cgroups. 

Johannes specifically mentioned that cgroup writeback will never call
into ->writepage anyway.

