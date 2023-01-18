Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA8672405
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674060572;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lgwAP3iZLubX4jJpj4ZhHlVnjkE2V1abu7VwSCjHn5c=;
	b=L8MpWtlxvh3f73TGolFJrFbw6eW//M/YVLASu3IZeT0VyJG8pscEqc9L7YwQT8Kvlr9Nrj
	BMipIK3Js3ioKz5aeERifAmtWheHRBUWed+XksuuLav5DtRD5SKu//LjyyAMjwVodvUc2K
	W711TQxSoI3zX/twktb7xTyUHOtUFfE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-poajOL0vNoCufHRJxDFtjw-1; Wed, 18 Jan 2023 11:49:30 -0500
X-MC-Unique: poajOL0vNoCufHRJxDFtjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B9262807D6E;
	Wed, 18 Jan 2023 16:49:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 395CF1121318;
	Wed, 18 Jan 2023 16:49:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21E841946A6E;
	Wed, 18 Jan 2023 16:49:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB38D1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:49:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6007C15BAD; Wed, 18 Jan 2023 16:49:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E878C15BAE
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:49:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F6E1C0A595
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:49:27 +0000 (UTC)
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-Vx9lfrV0MLKZZAmQCFdWZw-1; Wed, 18 Jan 2023 11:49:25 -0500
X-MC-Unique: Vx9lfrV0MLKZZAmQCFdWZw-1
Received: by mail-vs1-f71.google.com with SMTP id
 k124-20020a672482000000b003ceea654c04so8679127vsk.11
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 08:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgwAP3iZLubX4jJpj4ZhHlVnjkE2V1abu7VwSCjHn5c=;
 b=2ELF2OT9y4ZdEBcMQsfGIBnCT1l6tbQH+B8jrI1Mkr7VVQe7uQUssax81nto1cfk6n
 Eer145x1Omr8/QaRr3futD8cSD2Ou/YyASgW48n0zEWfiYyNiB9FJi3C39ZERU0b06DV
 KUiktMEl6scF9OWAIUH0U52xrhVcBTBNpGrV/WZlKxrxgZX1MERyU8qVtLkUBT6CP8La
 0iTaOEv/sGMkEpCye6D9RXGuhCDLit8yAGJGPuMfwNtNLH4mOPaHXImnVE8N+o/H8t8U
 qj/xFoLhdDdhGrIinPGiX+nELevJ38UbPFTlAR2d9/Rlp59X5X027XmIXoWBRsve14jx
 X2zw==
X-Gm-Message-State: AFqh2kquF/QO1dEo5xzZxVxlLQn1TuDpjzMjjdCiL69YmSjOIb7KPmL+
 7fP3LAKhBh/wtW0Tb0Ae7T12FiMkDw6JUQpGhpSzqyLZq2cpgxlyq95tQVeQO3n4YA2oHreG/db
 p4Is6JyXiu4GDcnMhN3Fekg==
X-Received: by 2002:a05:6122:c54:b0:3d5:5366:dc6c with SMTP id
 i20-20020a0561220c5400b003d55366dc6cmr4414362vkr.4.1674060565083; 
 Wed, 18 Jan 2023 08:49:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRoSYdOHAFhWX6SkAWaiD3PJ9bgCoG4JU7ThLaby5WFm6CrHkvSID8k/76bqXjrAWdFrKBiQ==
X-Received: by 2002:a05:6122:c54:b0:3d5:5366:dc6c with SMTP id
 i20-20020a0561220c5400b003d55366dc6cmr4414340vkr.4.1674060564852; 
 Wed, 18 Jan 2023 08:49:24 -0800 (PST)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 dt26-20020a05620a479a00b00705c8cce5dcsm11812650qkb.111.2023.01.18.08.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:49:24 -0800 (PST)
Date: Wed, 18 Jan 2023 11:50:26 -0500
From: Brian Foster <bfoster@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y8gjUhcRYkRuxLDq@bfoster>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-5-hch@lst.de> <Y8f6sShghKuFim5E@bfoster>
 <20230118164358.GD7584@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230118164358.GD7584@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 05:43:58PM +0100, Christoph Hellwig wrote:
> On Wed, Jan 18, 2023 at 08:57:05AM -0500, Brian Foster wrote:
> > This all seems reasonable to me at a glance, FWIW, but I am a little
> > curious why this wouldn't split up into two changes. I.e., switch this
> > over to filemap_get_entry() to minimally remove the FGP_ENTRY dependency
> > without a behavior change, then (perhaps after the next patch) introduce
> > SGP_FIND in a separate patch. That makes it easier to review and
> > potentially undo if it happens to pose a problem in the future. Hm?
> 
> The minimal change to filemap_get_entry would require to add the
> lock, check mapping and retry loop and thus add a fair amount of
> code.  So I looked for ways to avoid that and came up with this
> version.  But if there is a strong preference to first open code
> the logic and then later consolidate it I could do that.
> 

Ok. Not a strong preference from me. I don't think it's worth
complicating that much just to split up.

Brian

