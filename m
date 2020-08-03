Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F1D3B23ABF2
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 19:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596477414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2gwgHEj6ykRKVSYrLyCe4vx+BSD3YCsGzjAkud6/Uck=;
	b=VgDchRwqFv+BGRPkpVJHCBi4zwwvW9jMAmskQ01xkkmoYZ2tDCVT3fqX25tXdxRK//xc+a
	K0NHk1DQTnzPdUwnc1jgDDts5nIk3eUPzyP4eM53JoIm9j4a15jGQS8DKFd6WBMC7q9pTA
	EMwl3XYHI4Brgi5brOqmNL6mEqFBPus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-QgLRxu1UPgmi-O4Fy7hkuA-1; Mon, 03 Aug 2020 13:56:53 -0400
X-MC-Unique: QgLRxu1UPgmi-O4Fy7hkuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5E0579EC2;
	Mon,  3 Aug 2020 17:56:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D39675DA6A;
	Mon,  3 Aug 2020 17:56:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA8649A11B;
	Mon,  3 Aug 2020 17:56:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073Ht7lD014982 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 13:55:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CDDEA9FDB; Mon,  3 Aug 2020 17:55:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08298E2A68
	for <cluster-devel@redhat.com>; Mon,  3 Aug 2020 17:55:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E31541859163
	for <cluster-devel@redhat.com>; Mon,  3 Aug 2020 17:55:04 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-XsALc0a2NG-AcvAnZ_xcGQ-1; Mon, 03 Aug 2020 13:55:03 -0400
X-MC-Unique: XsALc0a2NG-AcvAnZ_xcGQ-1
Received: by mail-oi1-f197.google.com with SMTP id o132so21362906oig.12
	for <cluster-devel@redhat.com>; Mon, 03 Aug 2020 10:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2gwgHEj6ykRKVSYrLyCe4vx+BSD3YCsGzjAkud6/Uck=;
	b=AF2PRXTlYZRdEtKjBWrw9M29UNBi+k93m0rjLnLgH8GBpjkjCRTped78bUChyGqusZ
	cRFewQZ4ayGnsZmR81JmKTFVhPMapoTTRpbMWzhcip1O/aW2vCvUaKPgWfmhWFX6vOi5
	0J9ZVdwY4/sW71zs33aPNXpwjr1vN1SUy3I5v0bXlssq6KkKhLMaTWavkQYTMk1qEQ0s
	ZPFsgESsD8xXBH0jUv8bJ6w07dmKN70KyauDtDTWn5nTIqELyQ1lWuezSgvqIAd1I+ae
	FdkHw5rT6GWyyrNn3qF1fYFz/j570AE3yxiAV+w3ZSzQReSGXkJC/WzHJNK0nnE8g7tj
	kbZA==
X-Gm-Message-State: AOAM533KOvGfHy57bugk/Cb5oEeS5YCdeM6kmjYoVAxfKki49WYKlptq
	JgHPWXun2LdRHiWx/BHRSHv3hLJyMfIPHTZPkC7JrphjsMnrx1ulj0pgeliJLl4v7Aqq1uhNS3b
	4deGuJsxy/2OVxhEOGy42jNnoD8bou3+vD1RxMQ==
X-Received: by 2002:a4a:be0c:: with SMTP id l12mr15246403oop.22.1596477302243; 
	Mon, 03 Aug 2020 10:55:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhg6hONR8U+Y7exxti2NUs3fV9aiXlq9Qd4wpE+6KVH3Y1ejZvyA5OBhPhIxJlDCRrhmh5HmKfuqvbQOWsExQ=
X-Received: by 2002:a4a:be0c:: with SMTP id l12mr15246390oop.22.1596477302049; 
	Mon, 03 Aug 2020 10:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200724183304.366913-1-rpeterso@redhat.com>
	<20200724183304.366913-3-rpeterso@redhat.com>
In-Reply-To: <20200724183304.366913-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 3 Aug 2020 19:54:50 +0200
Message-ID: <CAHc6FU7bsaBESt=YkckQsT_dJ+KzFsG4OcdGvnekcYnFNpzZVA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 02/11] gfs2: don't break integrity
 writeback on __gfs2_jdata_writepage error
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Fri, Jul 24, 2020 at 8:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Port Brian Foster's patch 3fa750dcf29e8606e3969d13d8e188cc1c0f511d to
> gfs2's sister function gfs2_write_cache_jdata. Brian's original description: [...]

I don't think there's a need to repeat Brian's description; it's easy
enough to look up
from the sha1. I'd be more interested in learning what this change means in the
context of gfs2 (that is, what does gfs2 need this change for).

Thanks,
Andreas

