Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2211155BBB0
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jun 2022 21:16:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-YbyOhcVTO3KRv49-R53XBw-1; Mon, 27 Jun 2022 15:16:39 -0400
X-MC-Unique: YbyOhcVTO3KRv49-R53XBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC9F81D9CE;
	Mon, 27 Jun 2022 19:16:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C66774011A3E;
	Mon, 27 Jun 2022 19:16:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 817B1194704A;
	Mon, 27 Jun 2022 19:16:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1781F19466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Jun 2022 18:42:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD17DC2810D; Mon, 27 Jun 2022 18:42:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89AFC15D40
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 18:42:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B026781D9CA
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 18:42:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-bdh6R5KaMU63WbwoYnnPpg-1; Mon, 27 Jun 2022 14:42:37 -0400
X-MC-Unique: bdh6R5KaMU63WbwoYnnPpg-1
Received: by mail-ej1-f45.google.com with SMTP id pk21so21042894ejb.2;
 Mon, 27 Jun 2022 11:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F1V73gaHAzI2TDOJO8wgeUWrEPFOBJeqGG9WF2AbqRM=;
 b=E/M3KCYWjEupPSqCa6XA1Q+s/kz9YSfh1jVb6RoiVCCfodOubZnQpwvwOjBRVeo5SD
 yL1SuX3O4bhLQ7hGuJNKNWtP9qx2DaXpe9YJH4ECvuE0/EfgYu1UId7TbQWZqAJcG6Wl
 VKXzMRN+ow2vsRChdPnkdbFvZP/DExneiHZntwRwnin9/w1Hws44apR2GMgHll5VFasS
 QEfHI/RUdKodvBZwdk5Fsxri8Nn7k1nEnl2wRQ9knWZmrqf+BhIQRWWtLsCUHMq04FB/
 +2vk/yBrrJRUUBbZugci+BaPpXwOdMXYpJ92L/uIo91gXHNR9izQrXgsrlLcu8b7tzXI
 f2TQ==
X-Gm-Message-State: AJIora/SXX5OXt9X5cZO/SBFbXOzqF9HlJwfda2a9MFqE1otLGn5UPnI
 0FsAtZDVoanpgwqWg9D0iDCAOFTSpSM=
X-Google-Smtp-Source: AGRyM1s/WjXhfF/gr7kfYlkBny+mCrn4mI7SARL9dTywhDLA3BWNN8TBZm8nDi9ma6ZJWRgBu7nlMg==
X-Received: by 2002:a17:906:4fd6:b0:70c:9284:cc01 with SMTP id
 i22-20020a1709064fd600b0070c9284cc01mr14247221ejw.553.1656355356479; 
 Mon, 27 Jun 2022 11:42:36 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 rl4-20020a170907216400b0071cef6c53aesm5375045ejb.0.2022.06.27.11.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 11:42:35 -0700 (PDT)
Date: Mon, 27 Jun 2022 20:42:32 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20220627184232.tjfuzeir57l3h5ll@mail>
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Mon, 27 Jun 2022 19:16:34 +0000
Subject: Re: [Cluster-devel] sparse warnings related to kref_put_lock() and
 refcount_dec_and_lock()
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
Cc: cluster-devel <cluster-devel@redhat.com>, linux-sparse@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 11:15:17AM -0400, Alexander Aring wrote:
> Hi,
> 
> I recently converted to use kref_put_lock() in fs/dlm subsystem and
> now I get the following warning in sparse:
> 
> warning: context imbalance in 'put_rsb' - unexpected unlock
> 
> It seems sparse is not able to detect that there is a conditional
> requirement that the lock passed to kref_put_lock() (or also
> refcount_dec_and_lock()) is locked or not. I evaluate the return value
> to check if kref_put_lock() helds the lock and unlock it then. The
> idea is that the lock needs only to be held when the refcount is going
> to be zero.
> 
> It seems other users unlock the lock at the release callback of
> kref_put_lock() and annotate the callback with "__releases()" which
> seems to work to avoid the sparse warning. However this works if you
> don't have additional stack pointers which you need to pass to the
> release callback.
> 
> My question would be is this a known problem and a recommended way to
> avoid this sparse warning (maybe just for now)?

Hi,

I suppose that your case here can be simplified into something like:

	if (some_condition)
		take(some_lock);

	do_stuff();

	if (some_condition)
		release(some_lock);

Sparse issues the 'context imbalance' warning because, a priori,
it can't exclude that some execution will takes the lock and not
releases it (or the opposite). In some case, when do_stuff() is
very simple, sparse can see that everything is OK, but generally
it won't (some whole kernel analysis but the general case is
undecidable anyway).

The recommended way would be to write things rather like this:

	if (some_condition) {
		take(some_lock);
		do_stuff();
		release(some_lock);
	} else {
		do_stuff();
	}


The __acquires() and __releases() annotations are needed for sparse
to know that the annotated function always take or always release
some lock but won't handle conditional locks.

I hope that this is helpful to you.

-- Luc

