Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FFE740332
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 20:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687890381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SNWjDtbaNNqP8y2G6wASmQqrj1efzQChp45+zn86JxU=;
	b=Zz6n5j1fv8FlKN/kGXh541BIcDu0uqHzKVmBUfoyfp/oVXn4t6mSwEruTljV7rzoMsfIWl
	BuL4R9I/edmALXt7hLmr/F9+6wD/w+zYIWMSQnVUtqWVNEnP7i7Ql8loWK1O5mvKObFiY5
	/MscEvVw9qy4MoWhhSPvyMtEplYbqVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-PitCwHI7OImVLMGYP9BkKA-1; Tue, 27 Jun 2023 14:26:17 -0400
X-MC-Unique: PitCwHI7OImVLMGYP9BkKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6C7A8ED600;
	Tue, 27 Jun 2023 18:26:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAA8440C206F;
	Tue, 27 Jun 2023 18:26:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96C0E1946589;
	Tue, 27 Jun 2023 18:26:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F7E51946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 18:26:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 061B4401061; Tue, 27 Jun 2023 18:26:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F372940BB4D
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 18:26:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D931092E4C7
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 18:26:12 +0000 (UTC)
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-251-UhM_mF67Oomm5ZORVbpmOg-1; Tue,
 27 Jun 2023 14:26:10 -0400
X-MC-Unique: UhM_mF67Oomm5ZORVbpmOg-1
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Tue, 27 Jun 2023 20:26:02 +0200 (CEST)
X-EA-Auth: 9efLsvJKcKvnhci5w9xFlXD2LS7yzv66pA/KXBJc08NWD2BoLncs6YY+6AbJzknFlyRZiv5v7VwiHMG0h0i/wJa2qg8sZ7u+
Date: Tue, 27 Jun 2023 23:55:57 +0530
From: Deepak R Varma <drv@mailo.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <ZJsptSAVHroP5hDk@bu2204.myguest.virtualbox.org>
References: <ZJiUKeVy7G6ZkX80@bu2204.myguest.virtualbox.org>
 <1905283.taCxCBeP46@suse>
MIME-Version: 1.0
In-Reply-To: <1905283.taCxCBeP46@suse>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH] gfs2: Replace deprecated kmap_atomic()
 by kmap_local_page()
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
Cc: Sumitra Sharma <sumitraartsy@gmail.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, Ira Weiny <ira.weiny@intel.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mailo.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 27, 2023 at 01:11:46PM +0200, Fabio M. De Francesco wrote:
> On domenica 25 giugno 2023 21:23:21 CEST Deepak R Varma wrote:
> > kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
> > 
> >  		}
> > -		p = kmap_atomic(page);
> > +		p = kmap_local_page(page);
> >  		amt = size - copied;
> >  		if (offset + size > PAGE_SIZE)
> >  			amt = PAGE_SIZE - offset;
> >  		memcpy(buf + copied, p + offset, amt);
> 
> How about using memcpy_from_page()? 

We can do that. I will include that in v3.

Deepak.

> 
> Fabio
> 
> > -		kunmap_atomic(p);
> > +		kunmap_local(p);
> >  		put_page(page);
> >  		copied += amt;
> >  		index++;
> > --
> > 2.34.1
> 
> 
> 
> 


