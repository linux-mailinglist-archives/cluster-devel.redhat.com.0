Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B5EE928E429
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 18:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602692200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RtAYxusrn3VI4iJFVW1o26yYFZxqfXXOwC7PAN2W/Cc=;
	b=BoabEL6elF/OyACWfYamLTIHPy597ct0/0bmUuqWCtCWugGMeK37ObwaY1qN3m91udq3Sy
	9EIkXFIznEUizra2wC5AGw/Eb++27TTyc2UakZS7lVmkHnfPGn8bJ84Qkqyvj3W1mhe2V8
	VH8VOL/fCYnObeCyKJ89Cpq4FJ+kTvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-T_RrPpBhNzqmQJVljrIXNA-1; Wed, 14 Oct 2020 12:16:38 -0400
X-MC-Unique: T_RrPpBhNzqmQJVljrIXNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C972018C89C0;
	Wed, 14 Oct 2020 16:16:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23DA65C1BD;
	Wed, 14 Oct 2020 16:16:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05D425811A;
	Wed, 14 Oct 2020 16:16:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EGGTDs026509 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 12:16:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11BCC2157F24; Wed, 14 Oct 2020 16:16:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C7EE2157F23
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 16:16:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68920805F5F
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 16:16:26 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-363-cqJMsJidMBWipr7NUytu9A-1; Wed, 14 Oct 2020 12:16:24 -0400
X-MC-Unique: cqJMsJidMBWipr7NUytu9A-1
Received: by mail-wr1-f69.google.com with SMTP id k14so1584165wrd.6
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 09:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RtAYxusrn3VI4iJFVW1o26yYFZxqfXXOwC7PAN2W/Cc=;
	b=novNHrcY3b7cM2/MzQ2HyAtV1WKVKDepRGLxynAJd5osflNjPGxUWO6ticrkqfniAB
	9O2yGroNTDvFLtvS5zLoz5Sq90WGWcVXiPZlkySnpIt8Ag8F0gvCFhmsfED4BHdVbIoU
	fS9Q8Fs95emVP+9+GRx3zySpYT78VuvqkMbotvntePNnt/T/lFzKsCUWe+8t9bMYZ+6Q
	PGS2Ldy6NzV5qRWCmo/uj5+NhPzL0zr2HMNijbJEjiePwVNHT7pRWZGWR8Xa39Rz1GDx
	yKbT9vv4uTIOu/37RGgrTMd59f/ZYb7tITMl3apVqXkMjLJPdF+yyeWmbbX7VoDsACfI
	K2iw==
X-Gm-Message-State: AOAM530AxF+cTcCy/qVW6cok7JjYMT2wjvR9QiYiKtIMcdlozGgm/IZh
	w18yJ/H+uS72g7wnht+3/MJZCTP0uYjttNmCdJiFKVLXlkZnA+p9+V68DscKvZvy5318sVwQDTD
	legdL4QkFtZrHFufRMNGxp9HdlfCiLHEkPD7R8A==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr6760406wro.357.1602692183483; 
	Wed, 14 Oct 2020 09:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0pc3UMuVjbEWodIDHi2c2G20u9S5GZfntMAbRLzEf8oBDozq2uYjPG01CJ/rBYRMuYf59MlCeWJZbHHBKIu8=
X-Received: by 2002:adf:ed52:: with SMTP id u18mr6760390wro.357.1602692183291; 
	Wed, 14 Oct 2020 09:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201012131309.59316-1-jamie@nuviainc.com>
In-Reply-To: <20201012131309.59316-1-jamie@nuviainc.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 14 Oct 2020 18:16:12 +0200
Message-ID: <CAHc6FU5x0p4yCz7dfocokjtB1cRcwJzL_M3RauDYTO80_bKU9A@mail.gmail.com>
To: Jamie Iles <jamie@nuviainc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 5/5] gfs2: use-after-free in sysfs
	deregistration
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Jamie,

On Mon, Oct 12, 2020 at 3:13 PM Jamie Iles <jamie@nuviainc.com> wrote:
> Use the same pattern as f2fs + ext4 where the kobject destruction must
> complete before allowing the FS itself to be freed.  This means that we
> need an explicit free_sbd in the callers.

thanks, I'm adding that to for-next.

Andreas

