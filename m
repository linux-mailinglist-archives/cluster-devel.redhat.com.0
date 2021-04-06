Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8E9C355773
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 17:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617721953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8L6y+2eoSCM7a8wa7Fwz8mYPRlL51908yuDqX0IRWaI=;
	b=WhhKBq3jO8JUg8cLXESrXiywFyXgFKkEz1BFXdySFf2T+Ig/VZsBHkn2XQMflt6iCm5HD6
	cGZGuCIEMnvgWUWrVzN+yUKfRU3OFt1Pwl7tQahHlybJpPJ2agln6Y+RPlxPweny/oDaYj
	VM4yGxXvEgalTM5n6/c4cACApPxyu58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-lTTW3s3cPjmbRE_4WUomMw-1; Tue, 06 Apr 2021 11:12:32 -0400
X-MC-Unique: lTTW3s3cPjmbRE_4WUomMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6CD2814338;
	Tue,  6 Apr 2021 15:12:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A745D100239A;
	Tue,  6 Apr 2021 15:12:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 869FE1809C83;
	Tue,  6 Apr 2021 15:12:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136FCIjD020675 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 11:12:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53A032026D65; Tue,  6 Apr 2021 15:12:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C0052026D7F
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 15:12:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C23A802816
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 15:12:15 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-602-WfBU0qObNGG5PXizqpZssQ-1; Tue, 06 Apr 2021 11:12:12 -0400
X-MC-Unique: WfBU0qObNGG5PXizqpZssQ-1
Received: by mail-wr1-f72.google.com with SMTP id p2so364835wrq.18
	for <cluster-devel@redhat.com>; Tue, 06 Apr 2021 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8L6y+2eoSCM7a8wa7Fwz8mYPRlL51908yuDqX0IRWaI=;
	b=hdnDuay1KdvutZXjFloPB8Lvca7LxPOKC6MIhDgvdjkUtqD5VMx8WsAza0dTJ7n4lc
	NqTlifS8AD3v39Nz4GB8ptZzMsTYL5ewBk0R9qGeMVGyby1EQa9EVBr43XIPGZ1S5QWO
	JAmwkgE/5zDUYPdRURNrzx4Og3ut9OtKOxjJ7mJhz1UIQ9fSSQl4TIdyjRukXAZwqAWg
	Z8X2HyTusmhqy4FcnaCOTcPMjebzvjLtkltJ6i4Mgr9m2RSZyckdy/Szcp4wAhW9ZT7i
	PIjhsKhM+IGCfXOB6OMryJvPm1f7NGnxNXNPjH4w1v1lbzIu4H+Lhysnh4R02uk1Tnk8
	SwcQ==
X-Gm-Message-State: AOAM533tNi5xY6uvffdNWWekyLQa+ZiSpWBlJkADNzeaMmDxeuEkhPlb
	n4q35Sj6P/5Nza+XTGJnolv8w4wh6Sh2k0aSy7bjXzEqEoMqVcPRuHmj5oY7X8IB1ldBzswQo0/
	5boW2X3ZRl0TYfCzvTM/NIBY9jOrmipGg/EuDHQ==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr35218396wrp.182.1617721931460; 
	Tue, 06 Apr 2021 08:12:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdxWRNzKyAt3v3taLLDUy5DtHpPVFAo98QpxacSzq686dYjgwoG90alEBccmXrcpJQoSomIQyiURt2ojdV6XQ=
X-Received: by 2002:adf:efc7:: with SMTP id i7mr35218379wrp.182.1617721931279; 
	Tue, 06 Apr 2021 08:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <163225009.65195112.1616422443178.JavaMail.zimbra@redhat.com>
	<1435600148.65195184.1616422485023.JavaMail.zimbra@redhat.com>
In-Reply-To: <1435600148.65195184.1616422485023.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 6 Apr 2021 17:12:00 +0200
Message-ID: <CAHc6FU5ndnax6t_qzd_tQU1kh6gBT-U_PfvDqpOekxvCDc3eUw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2] gfs2: fast dealloc for exhash
	directories
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 3:15 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, whenever a directory was deleted, it called function
> __gfs2_dir_exhash_dealloc to deallocate the directory's leaf blocks.
> But __gfs2_dir_exhash_dealloc never knew if any given leaf block had
> leaf continuation aka "next" blocks, so it read every single leaf block
> in, only to determine in 99% of the cases that there was none. Still,
> this reading in of all the leaf blocks was very slow.
>
> This patch adds a new disk flag that indicates whether a directory is
> clean of any "next leaf" blocks. If so, it takes an optimized path that
> just deletes the leaf blocks and zeroes out the hash table.i_depth

The algorithm description in dir.c suggests that lf_next cannot be set
as long as i_depth < GFS2_DIR_MAX_DEPTH. I didn't see where that is
being checked in the code, but I may have missed it. If that check is
indeed missing, adding it would save a lot of time in most cases. That
should be paired with asserts that prevent lf_next from being set
unless i_depth == GFS2_DIR_MAX_DEPTH.

Beyond that, this patch adds a single per-inode GFS2_DIF_NO_NEXT_LEAF
flag, so as soon as a single leaf block overflows, we'll end up
reading all leaf blocks anyway. Which means that the patch only helps
performance in a very narrow window. To really make a difference, we'd
need such a flag per index entry, but the index uses physical block
numbers instead of logical block numbers, so we don't have any bits
left there.

> It would seem to make more sense to have the new bit indicate when a
> directory contains "next leaf" blocks rather than the inverse, but we
> need to treat file systems created by older versions of gfs2 as if
> they have "next leaf" blocks.

Andreas

