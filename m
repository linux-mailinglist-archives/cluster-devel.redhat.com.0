Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6779B365207
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Apr 2021 08:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618898595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CNuutkOldGufbEq5HGj09i+B3TBWHUsxl+sFu+LFwJY=;
	b=BvH2EmsNW8hyd63CZuNmJ+0mP81kxfoqu5crP78+KmEgFkbJFkoi05Gw2viO0TL8ecEJeM
	nCUg2IY3Nqfykgyy2acI8H3TJuuJHcXzA36CJLuJxgzs8a0/KUeeGYDWswNr5Euz+5no3x
	xl38sldViSijL5+5shKXV2dYJohjYmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-FoddyO1YMymaspDoEWW6Zw-1; Tue, 20 Apr 2021 02:02:13 -0400
X-MC-Unique: FoddyO1YMymaspDoEWW6Zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5DBF881D77;
	Tue, 20 Apr 2021 06:02:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2C0B61F49;
	Tue, 20 Apr 2021 06:02:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB8044ED79;
	Tue, 20 Apr 2021 06:02:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13K62192021634 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 02:02:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81C746E1B5; Tue, 20 Apr 2021 06:02:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 795E46E1AF
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 06:01:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9429880B91E
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 06:01:58 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-6wZjUuI-POC_iMvPXvvgyw-1; Tue, 20 Apr 2021 02:01:56 -0400
X-MC-Unique: 6wZjUuI-POC_iMvPXvvgyw-1
Received: by mail-wr1-f71.google.com with SMTP id
	j16-20020adfd2100000b02901022328749eso10296764wrh.4
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 23:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CNuutkOldGufbEq5HGj09i+B3TBWHUsxl+sFu+LFwJY=;
	b=JExcpLE6PZzsmNvj6EYMCXC96wuWtDBaZPpxL4pEAQla6v7s3NaB0qALpMJHFaz9yr
	a7t6YI4PeUBsUjsT2UhZ/rNHLmdiSZKJeC5wUpTVBNHc1flyFBH8fL99TSgAUqlH23cY
	yb4YM9y8tOzulej+JjhyuY7zVE697njpcOxhTCkoKRMmyS9XhCoz9YodLFCieBtyiKPP
	gVdOmOGBPAYVfHOoDOijBskTZGcFg4bIjoY0jI74+YDqYQBjEa3YQfLyyA0+OFwiiJB3
	8YkX3sniViwAsgDSNdGcMUV+Hst0awzS38KlJWnigiyGggVuACTURYpnIWznCwyK6zEy
	jVhw==
X-Gm-Message-State: AOAM531YAxIfdVB/RXCZy4xLLqcOusHrlpjFCVKon+5uXtJY5bLuBWyR
	M6eGVBsnHVkGBcWIM9sij4ZqQDFwEMKczb+qAqIo9HE7dhfANYCzfZ/qgmrjGOh2AxiliYxBEpw
	qXUqV+rsXQ3qA29CmUC+elZWyaLZTwV3AYxzaKg==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr18403080wrt.182.1618898515165;
	Mon, 19 Apr 2021 23:01:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFu2uciHrrUABwjm2gPHB+pTGSC+rM3jr0WE1WEev4+hoFlJpRqTFm2/yGSUTMk8Z8/3NLY/CD9GQudtx4jU4=
X-Received: by 2002:a5d:508d:: with SMTP id a13mr18403062wrt.182.1618898514996;
	Mon, 19 Apr 2021 23:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210419191117.297653-1-anprice@redhat.com>
	<20210419191117.297653-2-anprice@redhat.com>
	<CAHc6FU6+DNareW3Zb_=A9vsct07CcSm9DOcWWoiyv0Pg7NO=kQ@mail.gmail.com>
	<9472a989-1265-65d2-292b-5110176c15c6@redhat.com>
In-Reply-To: <9472a989-1265-65d2-292b-5110176c15c6@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 20 Apr 2021 08:00:00 +0200
Message-ID: <CAHc6FU5xAryzhtp+yniEU=cLaZH=mu1+woc76YLo_NrsRMj+iw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 1/8] Import linux/gfs2_ondisk.h
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 19, 2021 at 10:47 PM Andrew Price <anprice@redhat.com> wrote:
> On 19/04/2021 20:35, Andreas Gruenbacher wrote:
> > Andy,
> >
> > On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
> >> diff --git a/gfs2/include/gfs2_ondisk.h b/gfs2/include/gfs2_ondisk.h
> >> new file mode 100644
> >> index 00000000..fc948f89
> >> --- /dev/null
> >> +++ b/gfs2/include/gfs2_ondisk.h
> >
> > any reason why this file shouldn't be at gfs2/include/linux/gfs2_ondisk.h?
>
> I didn't feel it was needed, but it does have the benefit of making sure
> we're not picking up the system linux/gfs2_ondisk.h when we #include
> <gfs2_ondisk.h> and it shows clearly that we're not trying to.

Well, we have "-I$(top_srcdir)/gfs2/include" in CPPFLAGS so
gfs2/include/linux/types.h is picked up by <linux/types.h>. We already
rely on that working. So gfs2/include/linux/gfs2_ondisk.h would be
picked up by <linux/gfs2_ondisk.h> already anyway.

Andreas

